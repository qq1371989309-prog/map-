# 规则配置说明

## 1. 风场目录

每个风场在 `rules` 下有独立目录：

```text
rules/<风场名称>/
├── device_maps.csv
├── relations.csv
├── extra_rules.txt
└── rule_profile.json
```

## 2. device_maps.csv

`device_maps.csv` 定义风机和地址映射关系。

常用字段：

- `fan`：风机名称。
- `line_no`：MAP 文件行号。
- `addr`：地址。
- `col2`、`col3`：匹配辅助列。
- `desc`：描述。
- `exclude`：是否排除。

## 3. relations.csv

`relations.csv` 定义默认仿真关系。

字段：

```text
enabled,local_fan,target_fan,note
```

示例：

```text
1,F1-01FJ,F1-02FJ,1号风机仿2号风机
```

## 4. extra_rules.txt

`extra_rules.txt` 用于维护额外行替换规则。

只有现场明确需要额外行替换时才维护该文件。

## 5. rule_profile.json

`rule_profile.json` 定义规则导入和 MAP 解析方式。

主要分组：

- `deviceMapFormat`：规则表导入格式。
- `mapParser`：MAP 文件解析规则。
- `extraRules`：额外规则解析配置。

## 6. 规则导入流程

1. 在“设置”页面选择当前风场。
2. 点击规则导入。
3. 选择 `.csv`、`.xlsx` 或 `.xls` 文件。
4. 导入后只更新当前风场目录，不影响其他风场。

