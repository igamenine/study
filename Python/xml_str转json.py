import json
import xmltodict

def xmlToJson(xml_str):
    '''传入xml字符串，返回字符串'''
    dic = xmltodict.parse(xml_str, encoding='utf-8')
    dic = json.dumps(dic, indent=4)
    return dic

if __name__=='__main__':
    print(xmlToJson("<dependency><groupId>org.json</groupId><artifactId>json</artifactId><version>20180130</version></dependency>"))