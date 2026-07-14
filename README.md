# flutter_base_project

面向小型移动应用的 Flutter 基础项目，优先保持结构简单和开发快速。

## 开发环境

- Flutter 3.44.6 stable
- Dart 3.12.2
- Android 和 iOS（iOS 15+）
- Web 和桌面平台不在当前验收范围内

## 项目结构

- GetX：页面路由、Controller 生命周期和局部响应式状态
- Dio：HTTP 请求、Token 注入及业务响应解包
- SharedPreferences：少量用户偏好和 Token 缓存
- ObjectBox：本地结构化数据
- `ui/<feature>/view + logic + state`：功能页面的轻量组织方式

项目有意不引入 Repository、UseCase、多模块依赖注入等复杂分层。规模扩大、数据源增多或多人并行开发时，再按实际需要增加边界。

## 常用命令

```shell
flutter pub get
# 首次在主机上运行 ObjectBox 单测时安装匹配的本地动态库
bash <(curl -s https://raw.githubusercontent.com/objectbox/objectbox-dart/main/install.sh) --quiet
dart run build_runner build
flutter analyze
flutter test
flutter build apk --debug
flutter build ios --debug --no-codesign
```

升级 ObjectBox 时，`objectbox`、`objectbox_flutter_libs` 和
`objectbox_generator` 必须使用相同版本，并在升级后重新运行代码生成。

ObjectBox Generator 5.3.2 要求 `analyzer <11`，因此当前精确锁定兼容的
`build_runner 2.15.1`；2.15.2 开始要求 `analyzer >=13.3`，暂时无法升级。

## 安全提醒

Android release 签名信息目前仍在 `android/app/build.gradle` 中明文配置。正式发布或将仓库共享给其他人前，应轮换已暴露的凭据，并迁移到不提交版本库的本地配置或环境变量。
