# 构建与发布

## 1. 安装依赖

```powershell
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

也可以执行：

```powershell
.\scripts\install_dev.ps1
```

## 2. 本地运行

```powershell
python src\MapFanSim.py
```

或执行：

```powershell
.\scripts\run_dev.ps1
```

## 3. 生成发布包

```powershell
.\scripts\build_release.ps1
```

输出：

```text
release\MapFanSim
```

发布包包含：

- `MapFanSim.exe`
- `_internal`
- `data`
- `rules`
- `input_maps`
- `output_maps`
- `download`
- `update`
- `backup`
- `reports`
- `logs`
- `tools`

## 4. 现场部署

1. 将 `release\MapFanSim` 整个文件夹复制到现场电脑。
2. 双击运行 `MapFanSim.exe`。
3. 在“设置”页面填写现场服务器连接信息。
4. 使用“测试连接”验证服务器目录和 `slaverMB_1.map` 是否可访问。

## 5. 清理构建产物

```powershell
.\scripts\clean.ps1
```

清理内容：

- `build`
- `dist`
- `release`
- Python 缓存
- 运行日志和临时输出文件
