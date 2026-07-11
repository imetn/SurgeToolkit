#!/bin/sh

set -eu

failed=0

report_files() {
  label=$1
  files=$2
  if [ -n "$files" ]; then
    printf '%s\n%s\n' "ERROR: $label" "$files"
    failed=1
  fi
}

sensitive_files=$(git ls-files --cached --others --exclude-standard | grep -Ei '\.(conf|sgconfig|mobileconfig|pem|key|p8|p12|pfx|cer|crt|der|csr|jks|keystore|ovpn)$' | grep -Evi '\.example\.conf$' || true)
report_files "发现禁止提交的配置、证书或密钥文件：" "$sensitive_files"

scan_tracked() {
  pattern=$1
  status=0
  git grep --untracked -I -l -E -e "$pattern" -- . \
    ':(exclude).github/scripts/check-sensitive.sh' \
    ':(exclude).github/workflows/security.yml' || status=$?
  if [ "$status" -gt 1 ]; then
    printf '%s\n' 'ERROR: 敏感信息扫描器执行失败。' >&2
    exit "$status"
  fi
}

gist_files=$(scan_tracked 'https?://gist\.(githubusercontent|github)\.com')
report_files "发现 Gist 地址：" "$gist_files"

key_files=$(scan_tracked '-----BEGIN (CERTIFICATE|.*PRIVATE KEY)-----')
report_files "发现证书或私钥内容：" "$key_files"

node_uri_files=$(scan_tracked '(ss|ssr|vmess|vless|trojan|hysteria|hysteria2|hy2|tuic|anytls)://')
report_files "发现可导入的节点 URI：" "$node_uri_files"

credential_param_files=$(scan_tracked '[?&](token|key|password|passwd|secret|auth|authorization|access_token|api_key)=')
report_files "发现 URL 中的敏感参数：" "$credential_param_files"

proxy_line_files=$(scan_tracked '^[[:space:]]*[^#;[:space:]][^=]*=[[:space:]]*(ss|vmess|vless|trojan|hysteria|hysteria2|tuic|snell|wireguard|socks5|http|https),')
report_files "发现可能包含凭据的 Surge 节点定义：" "$proxy_line_files"

if [ "$failed" -ne 0 ]; then
  printf '%s\n' '安全检查失败。输出仅列出文件名，不会显示敏感内容。'
  exit 1
fi

printf '%s\n' '敏感信息检查通过。'
