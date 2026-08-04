# SurgeToolkit

<h4 align="center">
  <img src="https://raw.githubusercontent.com/ennann/SurgeToolkit/main/config/surge.jpeg" alt="Surge" width="300">
  <br><span style="color:gray">Surge for macOS & iOS</span><br>
</h4>

> 简体中文 | [English](https://github.com/ennann/SurgeToolkit/blob/main/config/README_en.md)

## 概述
本仓库（`SurgeToolkit`）主要集成了各种与 Surge 软件相关的 Modules、Scripts 等工具。

## 三平台模板

| 平台 | 模板 |
| --- | --- |
| iOS | [Surge.iOS.example.conf](Templates/Surge.iOS.example.conf) |
| macOS | [Surge.macOS.example.conf](Templates/Surge.macOS.example.conf) |
| tvOS | [Surge.tvOS.example.conf](Templates/Surge.tvOS.example.conf) |

模板统一提供 Self/Public、地区和用途三层策略，其中 Speedtest 与 Download 支持优先直连。使用前请阅读 [模板说明](Templates/README.md)。

## 自有规则

| 规则 | 用途 |
| --- | --- |
| [Bybit](Rules/bybit.list) | Bybit 网页、App、REST API、WebSocket 与区域站点 |
| [Hubeiqiao Direct](Rules/hubeiqiao.list) | Hubeiqiao 用户配置的专用直连域名 |
| [Movies](Rules/movies.list) | 电影、剧集与网盘资源网站 |
| [Speedtest Overlay](Rules/speedtest.list) | 补充 tvOS 上发现的测速服务器域名 |

## 模块

| 模块名称       | 模块地址                                                                                     | 模块功能              | 原作者                                       |
| -------------- | -------------------------------------------------------------------------------------------- | --------------------- | -------------------------------------------- |
| YouTube去广告   | [Surge模块链接](https://raw.githubusercontent.com/Maasea/sgmodule/master/YoutubeAds.sgmodule)   | YouTube去广告、短视频 | [Maasea](https://github.com/Maasea)           |
| 微信阅读去广告   | [Surge模块链接](https://raw.githubusercontent.com/Maasea/sgmodule/master/WeRead.sgmodule)       | 去除无效信息          | [Maasea](https://github.com/Maasea)           |
| Keep去广告      | [Surge模块链接](https://raw.githubusercontent.com/Maasea/sgmodule/master/KeepAds.sgmodule)       | 去除无效信息          | [Maasea](https://github.com/Maasea)           |
| Bilibili        | [Surge模块链接](https://raw.githubusercontent.com/Maasea/sgmodule/master/Bilibili.Helper.sgmodule)| 去除无效信息          | [Maasea](https://github.com/Maasea)           |
| 京东比价   | [Surge模块链接](https://raw.githubusercontent.com/Rabbit-Spec/Surge/Master/Module/Spec/JD_Price/Moore/JD_Price.sgmodule)   | 点击商品标题查看最低价格 | [Rabbit-Spec](https://github.com/Rabbit-Spec)           |

## 脚本


## 面板
| 模块名称       | 模块地址                                                                                     | 模块功能              | 原作者                                       |
| -------------- | -------------------------------------------------------------------------------------------- | --------------------- | -------------------------------------------- |
| 节点IP信息   | [Surge模块链接](https://raw.githubusercontent.com/Rabbit-Spec/Surge/Master/Module/Panel/IP-Check/Moore/IP-Check.sgmodule)   | 查看当前代理节点的IP信息 | [Rabbit-Spec](https://github.com/Rabbit-Spec)           |



## 注意事项

1. **脚本来源**：本项目中的脚本均来自网络中其他项目。
2. **作者信息**：项目中会明确注明原作者的信息。如果您喜欢某个功能，请务必去给原作者点个 Star。
3. **版权声明**：所有脚本的版权归原作者所有。
4. **使用风险**：使用这些脚本和模块的风险由使用者自行承担。
5. **维护方式**：按实际使用情况持续验证和更新，不承诺固定发布周期。

## 安全边界

本仓库只存放可公开共享的规则、模块、脚本和示例。订阅地址、节点凭据、证书、私钥、Gist 地址或内容不得提交。详细要求见 [CONTRIBUTING.md](CONTRIBUTING.md)。
