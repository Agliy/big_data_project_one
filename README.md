# Data Engineering Zoomcamp - 实践项目

基于 [DataTalksClub Data Engineering Zoomcamp](https://github.com/DataTalksClub/data-engineering-zoomcamp) 的学习实践项目，使用阿里云替代原课程的 GCP/AWS，适合国内开发者参考。

## 项目结构

```
app/
├── pipeline/               # 数据管道模块
│   ├── ingest_data.py      # NYC Taxi 数据摄取脚本
│   ├── pipeline.py         # 数据处理管道
│   ├── Dockerfile          # 容器化配置
│   ├── docker-compose.yaml # 多容器编排
│   ├── pyproject.toml      # Python 依赖管理（uv）
│   └── sqltest.sql         # SQL 测试脚本
│
└── terraform/              # 基础设施即代码模块
    ├── main.tf                         # 基础版：直接配置阿里云资源
    ├── terraform_with_variables/       # 进阶版：变量化配置
    │   ├── main2.tf                    # 主配置文件
    │   └── variables.tf                # 变量声明
    └── keys/                           # 凭证存储（已加入 .gitignore）
```

## 技术栈

| 模块 | 技术 |
|---|---|
| 数据摄取 | Python, pandas |
| 容器化 | Docker, docker-compose |
| 包管理 | uv |
| 数据库 | PostgreSQL |
| 基础设施 | Terraform + 阿里云 |
| 对象存储 | 阿里云 OSS |

## 模块说明

### Pipeline 模块
使用 Docker 容器化的数据管道，将 NYC Taxi 数据摄取到 PostgreSQL 数据库。

### Terraform 模块
使用 Terraform 管理阿里云基础设施，替代原课程的 GCP 方案。

**terraform_basic** — 基础版，直接在 `main.tf` 中配置资源

**terraform_with_variables** — 进阶版，将配置与逻辑解耦：
- `variables.tf` 声明变量（region、bucket_prefix、acl 等）
- `terraform.tfvars` 赋值（本地使用，不上传 GitHub）

## 快速开始

### 环境要求
- Terraform >= 1.14.7
- Docker Desktop
- 阿里云账号 + AccessKey

### Terraform 使用

```powershell
# 1. 设置阿里云凭证（每次新开 PowerShell 需重新设置）
$env:ALIBABA_CLOUD_ACCESS_KEY_ID="你的AccessKey ID"
$env:ALIBABA_CLOUD_ACCESS_KEY_SECRET="你的AccessKey Secret"

# 2. 初始化
terraform init

# 3. 预览变更
terraform plan

# 4. 创建资源
terraform apply

# 5. 销毁资源（避免产生费用）
terraform destroy
```

## 注意事项

- 使用完云资源记得执行 `terraform destroy`，避免产生额外费用
- 阿里云 AccessKey 请使用主账号或授权了对应权限的 RAM 用户

## 学习参考

- [DataTalksClub DE Zoomcamp](https://github.com/DataTalksClub/data-engineering-zoomcamp)
- [Terraform 阿里云 Provider 文档](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
- [阿里云 RAM 访问控制](https://ram.console.aliyun.com/)
