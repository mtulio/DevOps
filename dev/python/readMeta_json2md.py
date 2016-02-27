#! /usr/bin/python



#> IMPORT
##> JSON lib will read JSON metadata
##> AST lib will parse (and remove) unicode string readed from JSON

import json, ast
from pprint import pprint

#global data_name
#global data_author
#global data_os_support
#global data_requirements
#global data_dependencies

####################################

def getJson(file_metadata):
  #> JSON file
  #file_metadata = 'metadata.json'
  #> READ JSON file
  with open(file_metadata) as data_file:    
    data_jsonU = json.load(data_file)

  #pprint(data_jsonU)
  
  #> PARSING JSON data
  # remove literal 'u'
  #print "JSON Fail: ", json.loads(json.dumps(data))
  #print "AST Win:", ast.literal_eval(json.dumps(data))
  
  #pprint(data)
  #pprint(data_ast['requirements'][0]['name'])
  #pprint(data_ast['requirements'][0]['version_requirement'])

  #> PRINT VALUES
  #pprint(data)

  return ast.literal_eval(json.dumps(data_jsonU))


def parseJSON(data):
  global data_name, data_version, data_author, data_summary, data_license, \
    data_source, data_project_page, data_issues_url, data_description, data_os_support, \
    data_requirements, data_dependencies

  ##> Get all keys available on metadata
  metadata_keys = data.keys()
  #print "KEYS=%s" % metadata_keys

  count = 0

  ###> Get metadata keys
  for key in metadata_keys:
    count += 1
    #print "[%d] - %s" % (count, key)
    if key == 'name':
      data_name = data['name']
      #print "NAME=%s" % data['name']
    if key == 'version':
      data_version = data['version']
    if key == 'author':
      data_author = data['author']
    if key == 'summary':
      data_summary = data['summary']
    if key == 'license':
      data_license = data['license']
    if key == 'source':
      data_source = data['source']
    if key == 'project_page':
      data_project_page = data['project_page']
    if key == 'issues_url':
      data_issues_url = data['issues_url']
    if key == 'description':
      data_description = data['description']
    if key == 'operatingsystem_support':
      data_LIST = data['operatingsystem_support']
      data_os_support = ''
      if data_LIST:
        for arr in data_LIST:
          data_os_support += "(%s %s) " % (arr['operatingsystem'], arr['operatingsystemrelease'])
          #print " %s %s" % (arr['operatingsystem'], arr['operatingsystemrelease'])
    if key == 'requirements':
      data_LIST = data['requirements']
      data_requirements = ''
      if data_LIST:
        for arr in data_LIST:
          data_requirements += "(%s %s) " % (arr['name'], arr['version_requirement'])
    if key == 'dependencies':
      data_LIST = data['dependencies']
      data_dependencies = ''
      if data_LIST:
        for arr in data_LIST:
          data_dependencies += "(%s %s) " % (arr['name'], arr['version_requirement'])

  #print "DATA_name=%s" % data_name
  #print "DATA_author=%s" % data_author
  #print "DATA_os_support=%s" % data_os_support
  #print "DATA_requirements=%s" % data_requirements
  #print "DATA_deps=%s" % data_dependencies

def getModuleInfo():
  # for read for each directory and create its table
  # getJSON
  file_metadata = 'metadata.json'
  data = getJson(file_metadata)

  # parseJSON
  parseJSON(data)

  #print "NAME=%s" % data_name
  #print "DESCRIPTION=%s" % data_author
  #print "DEPENDENCIES=%s" % data_os_support
  #print "=%s" % data_requirements
  #print "dependencies=%s" % data_dependencies

  # convert2table
  md_table = "| METADATA | VALUE                          |\n"
  md_table += "| ------------- | ----------------------------- |\n"
  md_table += "| `NAME`        | **%s**                     |\n" % data_name
  md_table += "| `VERSION`        | **%s**                     |\n" % data_version
  md_table += "| `SUMMARY`        | **%s**                     |\n" % data_summary
  md_table += "| `DESCRIPTION` | **%s**            |\n" % data_description
  md_table += "| `DEPENDENCIES` | %s            |\n" % data_dependencies
  md_table += "| `OS SUPPORT` | %s            |\n" % data_os_support
  md_table += "| `REQUIREMENTS` | %s            |\n" % data_requirements
  #md_table += "| `TAGS` | **%s**            |\n" % data_tags
  md_table += "| `AUTHOR` | **%s**            |\n" % data_author
  md_table += "| `LICENSE` | **%s**            |\n" % data_license
  md_table += "| `PROJECT CODE` | **%s**            |\n" % data_source
  md_table += "| `PROJECT PAGE` | **%s**            |\n" % data_project_page
  md_table += "| `ISSUES` | **%s**            |\n" % data_issues_url

  print md_table

  f = open('output.md', 'a+')
  f.write(md_table)



def main():
  result = getModuleInfo();
  print "Result is %s" % result

######################################
##> MAIN
main()
