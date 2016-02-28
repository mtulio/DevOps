#! /usr/bin/python

#
# Script create a reume of all your puppets. 
# DESCRIPTION - This script does:
# 1   - Checks all directory behind it and create a table of information extracted from metadata.json (if is available)
# 2.a - Checks Puppet Module Code Style of each module and create an 'STATS TABLE'
# 2.b - Reports all non-compliances lines using 'puppet-lint' ot check the codes
#
# NOTE: Place this script on root directory of your modules (environment/modules)
#
# EXAMPLE: $./build_PUPPET_MODULES_INFO.py
# '> See files:
# '-> PUPPET_MODULES_INFO.md : Description 2.a and 2.b
# '-> PUPPET_MODULES_STAT.md : Description 1.
# '-> PUPPET_MODULES.md      : PUPPET_MODULES_STAT.md and PUPPET_MODULES_INFO.md
#
# Created by Marco Tulio R Braga <git@mtulio.eng.br>
# Created at Feb, 28 2015
# Script URL: https://github.com/mtulio/DevOps/blob/master/puppet/modules/build_PUPPET_MODULES_HEALTH.py
#

import json, ast, os, time
from pprint import pprint

SCRIPT_URL = 'https://github.com/mtulio/DevOps/blob/master/puppet/modules/build_PUPPET_MODULES_HEALTH.py'

####################################
def getManifestStyleGuide(modname):
  # Check that your Puppet manifest conform to the style guide
  # Require puppet-lint installed on your profile: # gem install puppet-lint
  # See also: http://puppet-lint.com/

  global code_warn, code_error, code_warn_cnt, code_error_cnt, code_gen, code_gen_cnt, code_all_cnt
  code_warn_tmp = code_error_tmp = code_gen_tmp = ''

  BIN_CHECK='~/bin/puppet-lint'
  if not os.path.isfile(BIN_CHECK):
    code_warn = code_error = code_gen = code_warn_cnt = code_error_cnt = code_gen_cnt = code_all_cnt = ''

  mod_path = os.path.dirname(os.path.realpath(__file__)) + '/' + modname
  cmd_run = BIN_CHECK + ' ' + mod_path

  #stream = os.system(cmd_run)
  fd = os.popen(cmd_run)
  stream = fd.read()

  # Remove Module directory path
  code_result_by_file = stream.split(mod_path)

  # Filter stream by error type
  for line in code_result_by_file:
    line = line.replace('\n','|\n')
    if 'WARNING:' in line:
      code_warn += '| `WARNING` |' + line
      code_warn_tmp += line
    elif 'ERROR:' in line:
      code_error += '| `ERRORS` |' + line
      code_error_tmp += line
    elif line:
      code_gen += '| `GENERAL` |' + line
      code_gen_tmp += line 
      print "code_gen=[%s] line=[%s]" % (code_gen, line)

  # Get occurrences by original stream
  code_warn_cnt  = str(code_warn_tmp.count('WARNING:'))
  code_error_cnt = str(code_error_tmp.count('ERROR:'))
  code_gen_cnt   = str(code_gen_tmp.count('\n'))

  code_all_cnt   = str(code_warn_tmp.count('WARNING:') + code_error_tmp.count('ERROR:') + code_gen_tmp.count('\n'))

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
    if key == 'name':
      data_name = data['name']
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
          arr_ks = arr.keys()
          data_os_support_os = ''
          data_os_support_rl = ''
          for arr_k in arr_ks:
            if arr_k == 'operatingsystem':
              data_os_support_os = arr['operatingsystem']
            if arr_k == 'operatingsystemrelease':
              data_os_support_rl = arr['operatingsystemrelease']
          data_os_support += "(%s %s) " % (data_os_support_os, data_os_support_rl)
    if key == 'requirements':
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
    if key == 'dependencies':
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

def getModuleInfo(metafile, modname):

  global data_name, data_version, data_author, data_summary, data_license, \
    data_source, data_project_page, data_issues_url, data_description, data_os_support, \
    data_requirements, data_dependencies, data_tags

  global code_warn, code_error, code_warn_cnt, code_error_cnt, code_gen, code_gen_cnt
  code_warn = code_error = code_warn_cnt = code_error_cnt = code_gen = code_gen_cnt = 'N/I'

  global md_stat_body, md_codecheck

  if metafile == "NULL":
    data_name = data_version = data_author = data_summary = data_license = \
      data_source = data_project_page = data_issues_url = data_description = data_os_support = \
      data_requirements = data_dependencies = data_tags = False

  else:
    # get & parse JSON
    data_name = data_version = data_author = data_summary = data_license = \
      data_source = data_project_page = data_issues_url = data_description = data_os_support = \
      data_requirements = data_dependencies = data_tags = False
    data = getJson(metafile)
    parseJSON(data)


  md_table = '### MODULE-[' + modname + ']\n\n'
  #md_table += ' Module directory: ' + os.path.dirname(os.path.realpath(__file__)) + __file__ + '\n\n'
  md_table += "| **METADATA**  | **VALUE**  |\n"
  md_table += "|:-------------:|:-----------|\n"

  # convert2table
  if modname:
    md_table += "| `ALIAS NAME`         | **%s**                |\n" % modname
    md_stat_body += "| [%s](#module-%s) |" % (modname, modname)
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
    md_stat_body += " %s | %s %s |" % (data_version, data_name, pforge_url)
  else:
    md_table += "| `VERSION`      | `WARN:` _*Undefined value or `metadata.json` cannot be found*_ |\n"
    md_stat_body += " `NA` | `NA` |"
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

  getManifestStyleGuide(modname)
  md_stat_body += " %s | %s | %s | %s |\n" % (code_all_cnt, code_warn_cnt, code_error_cnt, code_gen_cnt)
  md_codecheck += "\n### MODULE-cst-[%s]\n\n" % (modname)  
  md_codecheck += "| **TYPE**  | **OCCURRENCES ON MODULE [%s](#module-%s)**  |\n" % (modname, modname)
  md_codecheck += "|:---------:|:----------------------------------------|\n"
  #md_codecheck += "| `NAME`     | **%s** |\n" % (modname)
  md_codecheck += code_warn
  md_codecheck += code_error
  md_codecheck += code_gen

  return md_table

def main():

  global mod_wo_metadata, md_stat_head
  global md_stat_body, md_codecheck

  OUTPUT_INFO = 'PUPPET_MODULES_INFO.md'
  OUTPUT_STAT = 'PUPPET_MODULES_STAT.md'
  OUTPUT_ALL = 'PUPPET_MODULES.md'

  if os.path.isfile(OUTPUT_INFO):
    os.remove(OUTPUT_INFO)

  if os.path.isfile(OUTPUT_STAT):
    os.remove(OUTPUT_STAT)

  if os.path.isfile(OUTPUT_ALL):
    os.remove(OUTPUT_ALL)

  md_note_script = '> > > > NOTE: This file was created automatically by script: [' + __file__ + ']('+ SCRIPT_URL +') at ['+ time.strftime("%c") +']\n'

  md_main  = '# PUPPET MODULES HEALTH\n'
  md_main += '***\n\n'
  md_main += md_note_script

  md_stat_head  = '## MODULES STATS\n'
  md_stat_head += '***\n'
  #md_stat_head += md_note_script
  md_stat_head += '> > > > NOTE: This file is parte of [PUPPET MODULES]('+ OUTPUT_ALL +') with all metadata modules information.\n\n'

  md_stat_body  = "| **MODULE** | **LOCAL VERSION** | **LATEST VERSION** | **[ALL ALERTS](#modules-code-style-check)** | **WARNS** | **ERRORS** | **GENERAL** |\n"
  md_stat_body += "|:------:|:-------------:|:--------------:|:---------------------------------------:|:-----:|:------:|:-------:|\n"

  md_codecheck  = '## MODULES CODE STYLE CHECK\n\n'
  md_codecheck  += '***\n'

  md_table_head  = '## MODULES INFORMATION \n'
  md_table_head += '***\n\n'
  #md_table_head += md_note_script
  md_table_head += '> > > > NOTE: This file is parte of [PUPPET MODULES]('+ OUTPUT_ALL +') with all metadata modules information.\n\n'

  md_table_head += 'Table of contents: \n'
  md_table_index = ''
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

    print "#> Getting module [%s] information..." % dir_file
    md_table_index += '* [MODULE: %s](#module-%s)\n' % (dir_file, dir_file)
    # Check module metadata or warning it
    if mod_wo_metadata:
      metafile = "NULL"
      md_table_body += getModuleInfo(metafile, dir_file)
    else:
      md_table_body += getModuleInfo(metafile, dir_file)

  md_table = md_table_head
  md_table += md_table_index
  md_table += md_table_body

  md_stat = md_stat_head
  md_stat += md_stat_body
  #md_stat += md_codecheck

  md_main += '\n'
  md_main += '1. [MODULES STATS](#modules-stats)\n'
  md_main += '2. [MODULES INFORMATION](#modules-information)\n'
  md_main += '3. [MODULES CODE STYLE CHECK](#modules-code-style-check)\n'
  md_main += '\n\n'
  md_main += md_stat
  md_main += md_table
  md_main += md_codecheck

  # Write to file
  f = open(OUTPUT_INFO, 'w')
  f.write(md_table)

  f = open(OUTPUT_STAT, 'w')
  f.write(md_stat)
  f.write(md_codecheck)

  f = open(OUTPUT_ALL, 'w')
  f.write(md_main)

  if os.path.isfile(OUTPUT_INFO):
    print "SUCCESS - Modules INFO was saved on file " + OUTPUT_INFO
  else:
    print "WARNIGN - Cannot found file " + OUTPUT_INFO

  if os.path.isfile(OUTPUT_STAT):
    print "SUCCESS - Modules STAT was was saved on file " + OUTPUT_STAT
  else:
    print "WARNIGN - Cannot found file " + OUTPUT_STAT

  if os.path.isfile(OUTPUT_ALL):
    print "SUCCESS - Modules Info and Modules stats was was saved on file " + OUTPUT_ALL
  else:
    print "WARNIGN - Cannot found file " + OUTPUT_ALL

######################################
##> MAIN
main()
