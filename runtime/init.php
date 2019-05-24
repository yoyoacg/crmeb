<?php 
\think\Hook::import(array (
  'app_init' => 
  array (
  ),
  'app_begin' => 
  array (
  ),
  'module_init' => 
  array (
  ),
  'action_begin' => 
  array (
  ),
  'view_filter' => 
  array (
  ),
  'log_write' => 
  array (
  ),
  'app_end' => 
  array (
  ),
));

 function sensitive_words_filter($str) { if (!$str) return ''; $file = ROOT_PATH. PUBILC_PATH.'/static/plug/censorwords/CensorWords'; $words = file($file); foreach($words as $word) { $word = str_replace(array("\r\n","\r","\n","/","<",">","="," "), '', $word); if (!$word) continue; $ret = preg_match("/$word/", $str, $match); if ($ret) { return $match[0]; } } return ''; } function makePathToUrl($path,$type = 2) { $path = DS.ltrim(rtrim($path)); switch ($type){ case 1: $path .= DS.date('Y'); break; case 2: $path .= DS.date('Y').DS.date('m'); break; case 3: $path .= DS.date('Y').DS.date('m').DS.date('d'); break; } if (is_dir(ROOT_PATH.UPLOAD_PATH.$path) == true || mkdir(ROOT_PATH.UPLOAD_PATH.$path, 0777, true) == true) { return trim(str_replace(DS, '/',UPLOAD_PATH.$path),'.'); }else return ''; } function filterEmoji($str) { $str = preg_replace_callback( '/./u', function (array $match) { return strlen($match[0]) >= 4 ? '' : $match[0]; }, $str); return $str; } function encrypt($data, $key) { $prep_code = serialize($data); $block = mcrypt_get_block_size('des', 'ecb'); if (($pad = $block - (strlen($prep_code) % $block)) < $block) { $prep_code .= str_repeat(chr($pad), $pad); } $encrypt = mcrypt_encrypt(MCRYPT_DES, $key, $prep_code, MCRYPT_MODE_ECB); return base64_encode($encrypt); } function decrypt($str, $key) { $str = base64_decode($str); $str = mcrypt_decrypt(MCRYPT_DES, $key, $str, MCRYPT_MODE_ECB); $block = mcrypt_get_block_size('des', 'ecb'); $pad = ord($str[($len = strlen($str)) - 1]); if ($pad && $pad < $block && preg_match('/' . chr($pad) . '{' . $pad . '}$/', $str)) { $str = substr($str, 0, strlen($str) - $pad); } return unserialize($str); } function strReplace($string,$start,$end) { $strlen = mb_strlen($string, 'UTF-8'); $firstStr = mb_substr($string, 0, $start,'UTF-8'); $lastStr = mb_substr($string, -1, $end, 'UTF-8'); return $strlen == 2 ? $firstStr . str_repeat('*', mb_strlen($string, 'utf-8') -1) : $firstStr . str_repeat("*", $strlen - 2) . $lastStr; }
\think\Config::set(array (
  'app_host' => '',
  'app_debug' => true,
  'app_trace' => false,
  'app_status' => '',
  'app_multi_module' => true,
  'auto_bind_module' => true,
  'root_namespace' => 
  array (
    'model' => '../model/',
  ),
  'extra_file_list' => 
  array (
    0 => 'D:\\php\\crmeb\\thinkphp\\helper.php',
  ),
  'default_return_type' => 'html',
  'default_ajax_return' => 'json',
  'default_jsonp_handler' => 'jsonpReturn',
  'var_jsonp_handler' => 'callback',
  'default_timezone' => 'PRC',
  'lang_switch_on' => false,
  'default_filter' => '',
  'default_lang' => 'zh-cn',
  'class_suffix' => false,
  'controller_suffix' => false,
  'default_module' => 'admin',
  'deny_module_list' => 
  array (
    0 => 'common',
  ),
  'default_controller' => 'Index',
  'default_action' => 'index',
  'default_validate' => '',
  'empty_controller' => 'Error',
  'use_action_prefix' => false,
  'action_suffix' => '',
  'controller_auto_search' => false,
  'var_pathinfo' => 's',
  'pathinfo_fetch' => 
  array (
    0 => 'ORIG_PATH_INFO',
    1 => 'REDIRECT_PATH_INFO',
    2 => 'REDIRECT_URL',
  ),
  'pathinfo_depr' => '/',
  'https_agent_name' => '',
  'url_html_suffix' => 'html',
  'url_common_param' => false,
  'url_param_type' => 0,
  'url_route_on' => true,
  'route_config_file' => 
  array (
    0 => 'route',
  ),
  'route_complete_match' => false,
  'url_route_must' => false,
  'url_domain_deploy' => false,
  'url_domain_root' => '',
  'url_convert' => true,
  'url_controller_layer' => 'controller',
  'var_method' => '_method',
  'var_ajax' => '_ajax',
  'var_pjax' => '_pjax',
  'request_cache' => false,
  'request_cache_expire' => NULL,
  'request_cache_except' => 
  array (
  ),
  'template' => 
  array (
    'type' => 'Think',
    'view_path' => '',
    'view_suffix' => 'php',
    'view_depr' => '\\',
    'tpl_begin' => '{',
    'tpl_end' => '}',
    'taglib_begin' => '{',
    'taglib_end' => '}',
  ),
  'view_replace_str' => 
  array (
  ),
  'dispatch_success_tmpl' => 'D:\\php\\crmeb\\thinkphp\\tpl\\dispatch_jump.tpl',
  'dispatch_error_tmpl' => 'D:\\php\\crmeb\\thinkphp\\tpl\\dispatch_jump.tpl',
  'exception_tmpl' => 'D:\\php\\crmeb\\thinkphp\\tpl\\think_exception.tpl',
  'error_message' => '页面错误！请稍后再试～',
  'show_error_msg' => false,
  'exception_handle' => '',
  'record_trace' => false,
  'log' => 
  array (
    'type' => 'File',
    'path' => 'D:\\php\\crmeb\\runtime\\log\\',
    'level' => 
    array (
    ),
  ),
  'trace' => 
  array (
    'type' => 'Html',
  ),
  'cache' => 
  array (
    'type' => 'File',
    'path' => 'D:\\php\\crmeb\\runtime\\cache\\',
    'prefix' => '',
    'expire' => 0,
  ),
  'session' => 
  array (
    'id' => '',
    'var_session_id' => '',
    'prefix' => 'think',
    'type' => '',
    'auto_start' => true,
    'expire' => 86400,
    'cache_expire' => 86400,
  ),
  'cookie' => 
  array (
    'prefix' => '',
    'expire' => 0,
    'path' => '/',
    'domain' => '',
    'secure' => false,
    'httponly' => '',
    'setcookie' => true,
  ),
  'database' => 
  array (
    'type' => 'mysql',
    'dsn' => '',
    'hostname' => '127.0.0.1',
    'database' => 'crmeb',
    'username' => 'root',
    'password' => 'root',
    'hostport' => '3306',
    'params' => 
    array (
    ),
    'charset' => 'utf8',
    'prefix' => 'eb_',
    'debug' => false,
    'deploy' => 0,
    'rw_separate' => false,
    'master_num' => 1,
    'slave_no' => '',
    'fields_strict' => false,
    'resultset_type' => '\\think\\Collection',
    'auto_timestamp' => false,
    'datetime_format' => 'Y-m-d H:i:s',
    'sql_explain' => false,
  ),
  'paginate' => 
  array (
    'type' => 'bootstrap',
    'var_page' => 'page',
    'list_rows' => 15,
  ),
  'console' => 
  array (
    'name' => 'Think Console',
    'version' => '0.1',
    'user' => NULL,
  ),
  'app_namespace' => 'app',
));