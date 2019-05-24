<?php 
return array (
  'id' => 
  array (
    'name' => 'id',
    'type' => 'int(11) unsigned',
    'notnull' => false,
    'default' => NULL,
    'primary' => true,
    'autoinc' => true,
  ),
  'access_token' => 
  array (
    'name' => 'access_token',
    'type' => 'varchar(256)',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
  'stop_time' => 
  array (
    'name' => 'stop_time',
    'type' => 'int(11) unsigned',
    'notnull' => false,
    'default' => NULL,
    'primary' => false,
    'autoinc' => false,
  ),
);