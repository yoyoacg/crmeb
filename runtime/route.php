<?php 
return array (
  'get' => 
  array (
    'captcha/[:id]' => 
    array (
      'rule' => 'captcha/[:id]',
      'route' => '\think\captcha\CaptchaController@index',
      'var' => 
      array (
        'id' => 2,
      ),
      'option' => 
      array (
      ),
      'pattern' => 
      array (
      ),
    ),
    'admin' => true,
  ),
  'post' => 
  array (
    'admin' => true,
  ),
  'put' => 
  array (
    'admin' => true,
  ),
  'delete' => 
  array (
    'admin' => true,
  ),
  'patch' => 
  array (
    'admin' => true,
  ),
  'head' => 
  array (
    'admin' => true,
  ),
  'options' => 
  array (
    'admin' => true,
  ),
  '*' => 
  array (
    'admin' => 
    array (
      'rule' => 
      array (
        0 => 
        array (
          'rule' => 'index2',
          'route' => 'admin/Index/index2',
          'var' => 
          array (
          ),
          'option' => 
          array (
            'method' => 'get',
          ),
          'pattern' => 
          array (
          ),
        ),
      ),
      'route' => '',
      'var' => 
      array (
      ),
      'option' => 
      array (
      ),
      'pattern' => 
      array (
      ),
    ),
  ),
  'alias' => 
  array (
  ),
  'domain' => 
  array (
  ),
  'pattern' => 
  array (
  ),
  'name' => 
  array (
    '\think\captcha\captchacontroller@index' => 
    array (
      0 => 
      array (
        0 => 'captcha/[:id]',
        1 => 
        array (
          'id' => 2,
        ),
        2 => NULL,
        3 => NULL,
      ),
    ),
    'admin/index/index2' => 
    array (
      0 => 
      array (
        0 => 'admin/index2',
        1 => 
        array (
        ),
        2 => NULL,
        3 => NULL,
      ),
    ),
  ),
);