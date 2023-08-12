# macOS默认输入法是按caps lock键切换中英文，和国人习惯的shift不符，系统默认又不允许更改热键，我们可以通过karabiner-elements软件曲线救国。
# 1、从官网下载并安装软件
https://karabiner-elements.pqrs.org/
# 2、创建配置文件
touch right_shift_toggle_chinese_english.json
# （在创建之前先确认「设置」-「键盘」-「输入法」-「选择上一个输入法是否为默认的control+space」，如果不是则要改回来或者将配置文件内容修改成实际键位）
# 3、编辑配置文件，将以下内容复制进去然后保存退出
# vim right_shift_toggle_chinese_english.json
{
  "title": "Toggle Chinese English With left_shift",
  "rules": [
    {
      "description": "left_shift 切换中英文，长按保持shift功能",
      "manipulators": [
        {
          "type": "basic",
          "from": {
            "key_code": "left_shift",
            "modifiers": {
              "optional": [
                "left_control"
              ]
            }
          },
          "to_if_alone": [
            {
              "key_code": "spacebar",
              "modifiers": [
                "left_control"
              ]
            }
          ],
          "to_if_held_down": [
            {
              "key_code": "left_shift"
            }
          ]
        }
      ]
    }
  ]
}
# 4、将配置文件拷贝至karabiner的complex_modifications的rule库中
mv right_shift_toggle_chinese_english.json ~/.config/karabiner/assets/complex_modifications/
# 5、安装软件后会有2个图标，打开karabiner-elements
# 6、选择「complex modifications」-「Add rule」-「left_shift 切换中英文，长按保持shift功能」-「Enable」
# 7、选择「complex modifications」-「Parameters」-「to_if_held_down_threshold_milliseconds」改成20
# 图文参考http://www.icodebang.com/article/304097