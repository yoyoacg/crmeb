<?php 
return array (
  'id' => 
  array (
    'name' => 'id',
    'type' => 'mediumint(11)',
    'notnull' => false,
    'default' => NULL,
    'primary' => true,
    'autoinc' => true,
  ),
  'pid' => 
  array (
    'name' => 'pid',
    'type' => 'mediumint(11)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'cate_name' => 
  array (
    'name' => 'cate_name',
    'type' => 'varchar(100)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'sort' => 
  array (
    'name' => 'sort',
    'type' => 'mediumint(11)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'pic' => 
  array (
    'name' => 'pic',
    'type' => 'varchar(128)',
    'notnull' => false,
    'default' => '',
    'primary' => false,
    'autoinc' => false,
  ),
  'is_show' => 
  array (
    'name' => 'is_show',
    'type' => 'tinyint(1)',
    'notnull' => false,
    'default' => '1',
    'primary' => false,
    'autoinc' => false,
  ),
  'add_time' => 
  array (
    'name' => 'add_time',
    'type' => 'int(11)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
);