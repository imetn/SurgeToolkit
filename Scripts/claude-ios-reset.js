const body = JSON.stringify({
  type: "error",
  error: {
    type: "session_expired",
    message: "Session expired"
  }
});

const headers = {
  "Content-Type": "application/json",
  "Cache-Control": "no-store",
  "Set-Cookie": [
    "sessionKey=; Path=/; Domain=.claude.ai; Expires=Thu, 01 Jan 1970 00:00:00 GMT; Secure; HttpOnly; SameSite=Lax",
    "routingHint=; Path=/; Domain=.claude.ai; Expires=Thu, 01 Jan 1970 00:00:00 GMT; Secure; HttpOnly; SameSite=Lax"
  ]
};

try {
  const url = typeof $request !== "undefined" ? $request.url : "";
  $notification.post("Claude iOS Reset", "已拦截 Claude 会话接口", url);
} catch (_) {}

$done({
  response: {
    status: 401,
    headers,
    body
  }
});
