<?php
namespace service;

use app\routine_two\model\routine\Token;

class TokenService
{
    //加密分割key
    private static $KEY='fb';
    //10位加密key
    private static $sKey='crmeb12345';
    //相隔付
    private static $seperater = "{&&}";

    /*
     * 验证token
     * @param string $token token
     * @param boolean $isSkip 是否跳过验证
     * */
    public static function checkToken($token,$isSkip=false)
    {
        //跳过验证
        if($isSkip) return true;
        //解密token
        $data=explode(self::$seperater,self::deCode($token));
        //验证是否为数组 数组length为6
        if(is_array($data) && count($data) == 7){
            //第一位不能为空
            if(empty($data[0])) return false;
            //验证加密字符串是否被篡改
            if($data[3]!=self::$sKey) return false;
            //验证token是否过期
            if((int)$data[5]<time()) return false;
            //验证当前用户加密的随机字符串
            if(!Token::checkRandString($data[0],$data[2])) return false;
            //返回第一位和二位数据
            return [$data[0],$data[1]];
        }
        return false;
    }

    /*
      * 获取token
      * @param string $string 加密字符串
      * @param string $openid 加密openid
      * @param int $valid_peroid token过期时间默认5天
      * @return token
      * */
    public static function getToken($string=1,$openid='0',$valid_peroid=259200)
    {
        $randstring=self::createNonceStr();
        $res=Token::SetRandString($string,$randstring);
        if(!$res) return false;
        return self::enToken($string,$openid,$randstring,$valid_peroid);
    }

    /*
     * 加密token字符串
     * @param string $string 加密字符串
     * @param string $openid 加密openid
     * @param int $valid_peroid token过期时间默认5天
     * @return token
     * */
    private static function enToken($string,$openid='0',$randString='',$valid_peroid=259200)
    {
        //加密字符串 + 相隔付 + openid + 相隔付 + 随机字符串 + 相隔付 +  加密字符串 + 相隔付 + 当前时间 + 相隔付 + token过期时间 + 相隔付
        $to_ken=$string.self::$seperater.
            $openid.self::$seperater.
            $randString.self::$seperater.
            self::$sKey.self::$seperater.
            time().self::$seperater.
            (time()+$valid_peroid).self::$seperater;
        $token=self::enCode($to_ken);
        return $token;
    }

    /**
     * 通用加密
     * @param String $string 需要加密的字串
     * @return String
     */
    private static function enCode($string) {
        $skey = array_reverse(str_split(self::$KEY));
        $strArr = str_split(base64_encode($string));
        $strCount = count($strArr);
        foreach ($skey as $key => $value) {
            $key < $strCount && $strArr[$key].=$value;
        }
        return str_replace('=', 'O0O0O', join('', $strArr));
    }

    /**
     * 通用解密
     * @param String $string 需要解密的字串
     * @param String $skey 解密KEY
     * @return String
     */
    private static function deCode($string) {
        $skey = array_reverse(str_split(self::$KEY));
        $strArr = str_split(str_replace('O0O0O', '=', $string), 2);
        $strCount = count($strArr);
        foreach ($skey as $key => $value) {
            $key < $strCount && $strArr[$key] = rtrim($strArr[$key], $value);
        }
        return base64_decode(join('', $strArr));
    }

    /**
     * 生成随机填充码
     * @return string 10位
     */
    private static function createNonceStr($length = 5)
    {
        $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        $str = "";
        for ($i = 0; $i < $length; $i++) {
            $str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
        }
        return "crmeb".$str;
    }
}