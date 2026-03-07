# new_project

这是我的第一个 Python 小项目，主要用来练习文件操作和数据处理。

## 项目里有啥

- **pipeline.py** — 接收命令行参数，用 pandas 跑一个简单的数据管道，传入第几天就处理第几天的数据
- **list_files.py** — 列出当前目录下所有文件，并把每个文件的内容打印出来
- **file1.txt / file2.txt / file3.txt** — 测试用的文本文件

## 怎么跑起来

先装依赖：
```bash
uv add pandas
```

运行 pipeline：
```bash
python pipeline.py 1
```

列出文件：
```bash
python list_files.py
```

## 环境

- Python 3.13
- pandas
- 用 uv 管理虚拟环境

## 说明

这个项目主要是自己练手用的，边学边做，代码比较简单，后续会慢慢完善 🚀
