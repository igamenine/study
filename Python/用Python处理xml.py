# 用于处理XML的Python接口分组在 xml 包中。

# 警告 XML 模块对于错误或恶意构造的数据是不安全的。 如果你需要解析不受信任或未经身份验证的数据，请参阅 XML 漏洞 和 defusedxml 包 部分。
# 值得注意的是 xml 包中的模块要求至少有一个 SAX 兼容的 XML 解析器可用。在 Python 中包含 Expat 解析器，因此 xml.parsers.expat 模块将始终可用。

# xml.dom 和 xml.sax 包的文档是 DOM 和 SAX 接口的 Python 绑定的定义。

# XML 处理子模块包括:

# xml.etree.ElementTree： ElementTree API，一个简单而轻量级的XML处理器

# xml.dom：DOM API 定义

# xml.dom.minidom：最小的 DOM 实现

# xml.dom.pulldom：支持构建部分 DOM 树

# xml.sax：SAX2 基类和便利函数

# xml.parsers.expat：Expat解析器绑定

# 详情请阅读官方文档https://docs.python.org/zh-cn/3/library/xml.html