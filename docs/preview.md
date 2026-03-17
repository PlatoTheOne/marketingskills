# 网页预览发布 SOP（README.html / index.html）

这份文档用于团队统一维护本仓库的网页预览能力，覆盖：

- 本地预览
- GitHub Pages 正式发布
- 标准更新流程
- 常见故障排查

适用仓库：`PlatoTheOne/marketingskills`  
正式预览地址：`https://platotheone.github.io/marketingskills/`

## 1. 页面文件说明

- `README.html`：网页主内容源文件（建议只编辑这个）
- `index.html`：线上入口文件（GitHub Pages 默认首页）
- `sync-readme-web.ps1`：同步脚本（将 `README.html` 复制到 `index.html`）
- `.github/workflows/deploy-pages.yml`：GitHub Pages 自动部署工作流

## 2. 本地预览

在 Windows 终端中进入仓库目录后执行：

```powershell
start .\index.html
```

如果你刚修改了 `README.html`，先同步再预览：

```powershell
powershell -ExecutionPolicy Bypass -File .\sync-readme-web.ps1
start .\index.html
```

## 3. 标准更新与发布流程

每次更新网页，统一按以下顺序执行：

1. 编辑 `README.html`
2. 同步到首页入口：

```powershell
powershell -ExecutionPolicy Bypass -File .\sync-readme-web.ps1
```

3. 提交并推送：

```bash
git add README.html index.html
git commit -m "feat: update web preview"
git push origin main
```

4. 打开 GitHub Actions，确认工作流 **Deploy README Web Preview** 运行成功。
5. 访问正式地址：`https://platotheone.github.io/marketingskills/`

## 4. GitHub Pages 配置（首次或异常时检查）

路径：`Repository Settings -> Pages`

- `Source` 必须为 **GitHub Actions**
- 不建议切回 `Deploy from a branch`（会和当前工作流模式冲突）

## 5. 常见问题排查

### 5.1 页面 404 或打不开

按顺序检查：

1. 是否已执行 `git push origin main`
2. Actions 中 `Deploy README Web Preview` 是否成功（绿色）
3. Pages Source 是否是 GitHub Actions
4. 浏览器是否缓存，尝试 `Ctrl + F5` 强刷
5. 等待 2-5 分钟后重试（Pages 可能有延迟）

### 5.2 Actions 没有自动触发

当前工作流会在以下文件变化时触发：

- `index.html`
- `README.html`
- `sync-readme-web.ps1`
- `.github/workflows/deploy-pages.yml`

如果你只改了其他文件，Actions 不会触发，这是预期行为。  
可手动触发：`Actions -> Deploy README Web Preview -> Run workflow`。

### 5.3 网页内容没有更新

最常见原因是忘记同步 `README.html -> index.html`。  
执行：

```powershell
powershell -ExecutionPolicy Bypass -File .\sync-readme-web.ps1
git add README.html index.html
git commit -m "fix: sync web preview entry"
git push origin main
```

### 5.4 复制按钮不工作

复制按钮依赖浏览器剪贴板权限：

- 建议使用最新版 Chrome / Edge
- 页面需要来自 `http(s)` 或本地可信上下文
- 若系统策略禁用了剪贴板 API，页面会回退到 `execCommand("copy")`

## 6. 推荐协作约定

- 约定只改 `README.html`，不要直接手改 `index.html`
- 每次改动后都执行一次 `sync-readme-web.ps1`
- PR 中包含以下最小变更集：
  - `README.html`
  - `index.html`
  - 必要时 `deploy-pages.yml` 或 `sync-readme-web.ps1`

## 7. 一键命令备忘

```powershell
# 1) 同步入口页
powershell -ExecutionPolicy Bypass -File .\sync-readme-web.ps1

# 2) 本地打开预览
start .\index.html

# 3) 提交 + 发布
git add README.html index.html
git commit -m "feat: update web preview"
git push origin main
```
