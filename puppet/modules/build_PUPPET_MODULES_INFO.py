#! /usr/bin/python

#
# Script create to build puppet modules metadata (metadata.json) in tables.
# The result will be saved on PUPPET_MODULES.md (the file is replaced)
#
# Created by Marco Tulio R Braga <git@mtulio.eng.br>
# Created at Feb, 28 2015
# Script URL: https://github.com/mtulio/DevOps/blob/master/puppet/modules/build_PUPPET_MODULES_INFO.py
#

import json, ast, os, time
from pprint import pprint

SCRIPT_URL = 'https://github.com/mtulio/DevOps/blob/master/puppet/modules/build_PUPPET_MODULES_INFO.py'

####################################
# Read JSON file
def getJson(file_metadata):

  with open(file_metadata) as data_file:    
    data_jsonU = json.load(data_file)

  #pprint(data_jsonU)

  #TODO: there is a bug when a value of key is null, we cannot use ast.literal_eval(), but what function I can use? :(
  return ast.literal_eval(json.dumps(data_jsonU))

#######################
# Parse JSON flow
## Assign values to global envs
def parseJSON(data):

  global data_name, data_version, data_author, data_summary, data_license, \
    data_source, data_project_page, data_issues_url, data_description, data_os_support, \
    data_requirements, data_dependencies, data_tags

  ##> Get all keys available on metadata
  metadata_keys = data.keys()
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
      #data_os_support = data['operatingsystem_support']
      data_LIST = data['operatingsystem_support']
      data_os_support = ''
      if data_LIST:
        for arr in data_LIST:
          arr_ks = arr.keys()
          data_os_support_os = ''
          data_os_support_rl = ''
          for arr_k in arr_ks:
            if arr_k == 'operatingsystem':
              data_os_support_os = arr['operatingsystem']
            if arr_k == 'operatingsystemrelease':
              data_os_support_rl = arr['operatingsystemrelease']
          data_os_support += "(%s %s) " % (data_os_support_os, data_os_support_rl)
          #if arr['operatingsystemrelease']:
          #  data_os_support += "(%s %s) " % (arr['operatingsystem'], arr['operatingsystemrelease'])
          #else:
          #  data_os_support += "(%s) " % (arr['operatingsystem'])
          #print " %s %s" % (arr['operatingsystem'], arr['operatingsystemrelease'])
    if key == 'requirements':
      #data_requirements = data['requirements']
      data_requirements = data['requirements']
      data_LIST = data['requirements']
      data_requirements = ''
      if data_LIST:
        for arr in data_LIST:
          arr_ks = arr.keys()
          data_requirements_nm = ''
          data_requirements_vr = ''
          for arr_k in arr_ks:
            if arr_k == 'name':
              data_requirements_nm = arr['name']
            if arr_k == 'version_requirement':
              data_requirements_vr = arr['version_requirement']
          data_requirements += "(%s %s) " % (data_requirements_nm, data_requirements_vr)
      #data_LIST = data['requirements']
      #data_requirements = ''
      #if data_LIST:
      #  for arr in data_LIST:
      #    #data_requirements += "(%s %s) " % (arr['name'], arr['version_requirement'])
      #    if arr['version_requirement']:
      #      data_requirements += "(%s %s) " % (arr['name'], arr['version_requirement'])
      #    else:
      #      data_requirements += "(%s %s) " % (arr['name'])
    if key == 'dependencies':
      #data_dependencies = data['dependencies']
      data_dependencies = data['dependencies']
      data_LIST = data['dependencies']
      data_dependencies = ''
      if data_LIST:
        for arr in data_LIST:
          arr_ks = arr.keys()
          data_dependencies_nm = ''
          data_dependencies_vr = ''
          for arr_k in arr_ks:
            if arr_k == 'name':
              data_dependencies_nm = arr['name']
            if arr_k == 'version_requirement':
              data_dependencies_vr = arr['version_requirement']
          data_dependencies += "(%s %s) " % (data_dependencies_nm, data_dependencies_vr)
      #data_LIST = data['dependencies']
      #data_dependencies = ''
      #if data_LIST:
      #  for arr in data_LIST:
      #    #data_dependencies += "(%s %s) " % (arr['name'], arr['version_requirement'])
      #    if arr['version_requirement']:
      #      data_dependencies += "(%s %s) " % (arr['name'], arr['version_requirement'])
      #    else:
      #      data_dependencies += "(%s %s) " % (arr['name'])


  #print "DATA_name=%s" % data_name
  #print "DATA_author=%s" % data_author
  #print "DATA_os_support=%s" % data_os_support
  #print "DATA_requirements=%s" % data_requirements
  #print "DATA_deps=%s" % data_dependencies

def getModuleInfo(metafile, modname):

  global data_name, data_version, data_author, data_summary, data_license, \
    data_source, data_project_page, data_issues_url, data_description, data_os_support, \
    data_requirements, data_dependencies, data_tags

  if metafile == "NULL":
    data_name = data_version = data_author = data_summary = data_license = \
      data_source = data_project_page = data_issues_url = data_description = data_os_support = \
      data_requirements = data_dependencies = data_tags = False
    #data_name = modname
  else:
    # get & parse JSON
    data_name = data_version = data_author = data_summary = data_license = \
      data_source = data_project_page = data_issues_url = data_description = data_os_support = \
      data_requirements = data_dependencies = data_tags = False
    data = getJson(metafile)
    parseJSON(data)


  md_table = '### MODULE-[' + modname + ']\n\n'
  #md_table += ' Module directory: ' + os.path.dirname(os.path.realpath(__file__)) + __file__ + '\n\n'
  md_table += "| METADATA       | VALUE                 |\n"
  md_table += "| -------------- | --------------------- |\n"

  # convert2table
  if modname:
    md_table += "| `ALIAS NAME`         | **%s**                |\n" % modname
  else:
    md_table += "| `ALIAS NAME`         | `WARN:` _*Undefined value or `metadata.json` cannot be found*_ |\n"
  if data_name:
    md_table += "| `NAME`         | **%s**                |\n" % data_name
  else:
    md_table += "| `NAME`         | `WARN:` _*Undefined value or `metadata.json` cannot be found*_ |\n"
  if data_version:
    pforge = data_name.split('-')
    pforge_url = '[![Puppet Forge](http://img.shields.io/puppetforge/v/%s/%s.svg)](https://forge.puppetlabs.com/%s/%s)' % (pforge[0], pforge[1], pforge[0], pforge[1])
    md_table += "| `VERSION`      | **%s**  %s              |\n" % (data_version, pforge_url)
  else:
    md_table += "| `VERSION`      | `WARN:` _*Undefined value or `metadata.json` cannot be found*_ |\n"
  if data_summary:
    md_table += "| `SUMMARY`      | **%s**                |\n" % data_summary
  else:
    md_table += "| `SUMMARY`      | `WARN:` _*Undefined value or `metadata.json` cannot be found*_ |\n"
  if data_description == False:
    md_table += "| `DESCRIPTION`  | `WARN:` _*Undefined value or `metadata.json` cannot be found*_ |\n"
  else:
    md_table += "| `DESCRIPTION`  | **%s**                |\n" % data_description
  if data_dependencies:
    md_table += "| `DEPENDENCIES` | %s                    |\n" % data_dependencies
  else:
    md_table += "| `DEPENDENCIES` | `WARN:` _*Undefined value or `metadata.json` cannot be found*_ |\n"
  if data_os_support:
    md_table += "| `OS SUPPORT`   | %s                    |\n" % data_os_support
  else:
    md_table += "| `OS SUPPORT`   | `WARN:` _*Undefined value or `metadata.json` cannot be found*_ |\n"
  if data_requirements:
    md_table += "| `REQUIREMENTS` | %s                    |\n" % data_requirements
  else:
    md_table += "| `REQUIREMENTS` | `WARN:` _*Undefined value or `metadata.json` cannot be found*_ |\n"
#  if data_tags:
#    md_table += "| `TAGS`        | **%s**                |\n" % data_tags
#  else:
#    md_table += "| `TAGS`         | `undefined or metadata.json not found` |\n"
  if data_author:
    md_table += "| `AUTHOR`       | **%s**                |\n" % data_author
  else:
    md_table += "| `AUTHOR`       | `WARN:` _*Undefined value or `metadata.json` cannot be found*_ |\n"
  if data_license:
    md_table += "| `LICENSE`      | **%s**                |\n" % data_license
  else:
    md_table += "| `LICENSE`      | `WARN:` _*Undefined value or `metadata.json` cannot be found*_ |\n"
  if data_source:
    md_table += "| `PROJECT CODE` | **%s**                |\n" % data_source
  else:
    md_table += "| `PROJECT CODE`         | `undefined`                |\n"
  if data_project_page:
    md_table += "| `PROJECT PAGE` | **%s**                |\n" % data_project_page
  else:
    md_table += "| `PROJECT PAGE` | `WARN:` _*Undefined value or `metadata.json` cannot be found*_ |\n"
  if data_issues_url:
    md_table += "| `ISSUES`       | **%s**                |\n" % data_issues_url
  else:
    md_table += "| `ISSUES`       | `WARN:` _*Undefined value or `metadata.json` cannot be found*_ |\n"
  md_table += '\n'

  #print md_table
  return md_table


def main():

  global mod_wo_metadata
  OUTPUT_FILE = 'PUPPET_MODULES.md'

  if os.path.isfile(OUTPUT_FILE):
    os.remove(OUTPUT_FILE)

  md_table_head  = '## PUPPET MODULES \n\n'
  md_table_head += '> > > > NOTE: This file was created automatically by script: [' + __file__ + ']('+ SCRIPT_URL +') at ['+ time.strftime("%c") +']\n\n'
  md_table_index = 'Table of contents: \n'
  md_table_body  = '\n'

  # Read eacho module on same dir of script

  for dir_file in os.listdir(os.path.dirname(os.path.realpath(__file__))):
    # Check if is directory
    if not os.path.isdir(dir_file):
      continue;

    mod_wo_metadata = True
    metafile = dir_file + '/metadata.json'
    initfile = dir_file + '/manifests/init.pp'

    # Check module has metadata and/or init class
    if not os.path.isfile(metafile) and not os.path.isfile(initfile):
      continue;

    elif not os.path.isfile(metafile) and os.path.isfile(initfile):
      mod_wo_metadata = True
    else:
      mod_wo_metadata = False

    print "#> Getting module [%s] info..." % dir_file
    md_table_index += '* [MODULE: %s](#module-%s)\n' % (dir_file, dir_file)
    # Check module metadata or warning it
    if mod_wo_metadata:
      metafile = "NULL"
      md_table_body += getModuleInfo(metafile, dir_file)
      #print " WARN - module has no metadata %s" % metafile
    else:
      #print " OK - module has metadata [%s]" % metafile
      md_table_body += getModuleInfo(metafile, dir_file)

  md_table = md_table_head
  md_table += md_table_index
  md_table += md_table_body

  # Write to file
  f = open(OUTPUT_FILE, 'w')
  f.write(md_table)


  if os.path.isfile(OUTPUT_FILE):
    print "SUCCESS - All data saved on file " + OUTPUT_FILE
  else:
   print "WARNIGN - Cannot found file " + OUTPUT_FILE


######################################
##> MAIN
main()
