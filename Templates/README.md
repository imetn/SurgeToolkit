# Surge 三平台模板

这里提供 iOS、macOS 和 tvOS 的公开配置骨架。三份模板有意保持相同的策略名称和规则顺序，方便跨设备同步选择习惯。

## 使用前准备

1. 将模板复制到私人目录后再填写节点，不要把完成后的私人配置提交回本仓库。
2. 在 `[Proxy]` 中添加自己的节点，或通过 Surge 界面管理节点。
3. 为了让地区和节点类型自动分组，请按以下格式命名节点：

```text
[HK][Self] Home
[HK][Public] Provider A
[US][Self] Server
[US][Public] Provider B
[SG] Provider C
[JP] Provider D
[TW] Provider E
```

## 策略设计

- `Speedtest`：`DIRECT` 永远排第一，也可选择香港/美国 Self、Public、新加坡和日本。
- `Download`：`DIRECT` 永远排第一，必要时可切换代理以处理区域限制或线路问题。
- `Stream`、`Twitter`、`Telegram`：不提供 `DIRECT`，避免误选后无法访问。
- `Bybit`：仅提供 `Taiwan`、`Japan`、`Others`，避免使用 Bybit 官方明确限制的美国出口。
- `HongKong`、`Taiwan`：默认 `hidden=1`，仍可被 Bybit、Stream 等策略嵌套调用。
- `SelfHost`、`America`：优先组织自建节点，同时保留 Public 线路作为后备。

## 规则顺序

模板先放置 `DOMAIN-SET` 和非 IP 规则，再放置 IP、GEOIP 与 FINAL 规则。这样可以减少代理域名在规则判断阶段触发本地 DNS 解析。大型通用规则引用 SukkaW 上游，本仓库只维护 Bybit 与 Speedtest 等小型补充规则。
