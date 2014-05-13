 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>唐人游戏平台</title>
<meta name="keywords" content="唐人游戏, 网页游戏, 游戏, WebGame, 网络游戏, 风之岛" />
<meta name="description" content="唐人游戏平台集精品游戏、个人中心、客服中心、游戏论坛等功能于一体，为用户提供最好的一站式娱乐体验。" />
  <link rel="shortcut icon" href="http://www.6998cdn.com/favicon.ico" />
<link href="/Cms_Data/Contents/MainDB/Media/skin/css/main.css" rel="stylesheet" type="text/css">
</head>

<body>
 <!--网站顶部开始-->
<div class="top">
    <div class="wrap">
      <div class="fl logobox"><a class="logo" href="/" title="唐人游戏平台"></a></div>
        <div class="fr nav" id="nav">
        	<ul>
              <li><a href="/" title="首 页">首 页</a></li>
                <li><a href="http://account.6998.com/" title="个人中心" target="_blank">个人中心</a></li>               
             	<li><a href="/youhui/" title="新手礼包" >新手礼包</a></li>
				<li><a href="http://www.6998.com/game" title="游戏中心" >游戏中心</a></li>              
                <li><a href="http://pay.6998.com/" title="充值中心" target="_blank">充值中心</a></li>
                <li><a href="http://kf.uc55.com/" title="客服中心" target="_blank">客服中心</a></li>
                <li><a href="http://bbs.6998.com/" title="论坛社区" target="_blank">论坛社区</a></li>
            </ul>
        </div>
    </div>
</div>
<!--网站顶部结束-->



<!--网站轮播内容开始-->
<div class="banner_box">
	<div class="wrap">
    	<!--banner+登录开始-->
		<div class="banner">
            <div class="banner_img">
              
              
              
<ul  class="list">
  	<a href="http://xxd.6998.com/xxd_20140508" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/ad/960-335-20140506-02.png" width="960" height="335"></a>
  	<a href="http://wy.6998.com/wy_20140507" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/ad/960-335-20140505-02.png" width="960" height="335"></a>
  	<a href="http://wy.6998.com/20140424" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/ad/960-335-20140423-01.png" width="960" height="335"></a>
  	<a href="http://nslm.6998.com/" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/ad/201404176998.png" width="960" height="335"></a>
  	<a href="http://gcld.6998.com/" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/ad/-A4C59DA6-403D-40B7-AC2C-C007A4E5C0FF-.png" width="960" height="335"></a>
</ul>
                
              
              
              
            </div>
<div class="banner_but">
  	<a href="javascript:;" class="sel">1</a>
  	<a href="javascript:;" class="">2</a>
  	<a href="javascript:;" class="">3</a>
  	<a href="javascript:;" class="">4</a>
  	<a href="javascript:;" class="">5</a>
</div>

                    <!--登录开始-->
<div id="no_login" class="signbox">
  
  
  
  
  <form id="J_LoginForm" name="form1" action="https://passport.6998.com/login" method="post">
    <input type="hidden" value="true" name="login_submit">
    <input type="hidden" name="continue" id="login_continue" value="">
    <input type="hidden" name="isajax" value="true">  
    <input type="hidden" name="service" value="http://www.6998.com/">  
    <input type="hidden" name="LT" value="" id="J_LoginTicket">
    <input type="hidden" name="_eventId" value="submit"> 

  
    
            	<div class="but signtop"></div>
                <div class="but signmid">
                  <input name="Username" class="inp_name" id="J_Username" value="" type="text" onfocus="if(this.value=='帐号')this.value='';" placeholder="帐号" />
                  <input name="Password" class="inp_name" type="password" id="J_Password" value="" onfocus="if(this.value=='密码')this.value='';" placeholder="密码"  />
                    <div class="for_box">
                    	<input type="checkbox" class="c_none" >
                        <!-- <label class="icon check_box">记住用户名</label> -->
                        <a class="for_pw" href="http://account.6998.com/RetrevePwd/Index" target="_blank">忘记密码</a>
                    </div>
                    <input type="submit" value="立即登录" class="but sign_now">
      
                    <label class="reg">还没有账号？<a href="http://account.6998.com/Reg" target="_blank">立即注册</a></label>
                </div>
                <div class="but signbot"></div>
    </form> 
  
            </div>
            <!--登录结束-->


  <!--登录后信息开始-->
<div id="logined" class="signbox" style="display:none;">
            	<div class="but signtop"></div>
                <div class="but signmid">
               	  <p class="log_usename">尊敬的：<span class="red" id="logined_name"></span></p>
                  <div class="fl log_head"><img src="http://account.6998.com/imgs/account/touxiang.jpg" width="82" height="82"></div>
                  <div class="fl log_game">
                  	<span>推荐游戏：</span>
                    <p class="log_gamename">
  
                      <a class="startGame" gameid="wy_2" gameurl="http://account.6998.com/mygame_login_wycq-50-0.html" href="http://account.6998.com/mygame_login_wycq-50-0.html" zone="2" target="_blank">[武易传奇]</a><br>                    
                      <a class="startGame" gameid="" gameurl="http://www.uc55.com/" href="http://www.uc55.com/" zone="" target="_blank">[唐人游棋牌]</a><br>                    

                    </p>
                  </div>
                  <!--<div class="but log_cettop"></div>-->
                  <div class="but log_cetmid">
                  	<ul>
                    	<li><a class="icon ex_ch_passwprd" href="http://account.6998.com/?open=password" title="修改密码" target="_blank">修改密码</a></li>
                        <li><a class="icon ex_mobile" href="http://account.6998.com/?open=mobile" title="绑定手机" target="_blank">绑定手机</a></li>
                        <li><a class="icon ex_reg" href="http://account.6998.com/" title="个人中心" target="_blank">个人中心</a></li>
                         <li><a class="icon log_out" href="https://passport.6998.com/Logout?service=http://www.6998.com/" title="退出登录">退出登录</a></li>
                    </ul>
                  </div>
                  <!--<div class="but log_cetbot"></div>-->
                </div>
                <div class="but signbot"></div>
            </div>
            <!--登后录后信息结束-->   
          
   		</div>
        <!--banner+登录结束-->
    </div>
</div>
<!--网站轮播内容结束--> 
<!--网站内容开始-->
<div class="cont_box">
	<div class="wrap">
    	 


<!--内容左边开始-->
    	<div class="fl cont_l">
            <!--开服列表内容开始-->
            <div class="i_ser_listbox">
            	<div class="i_ser_titbox">
                	<div class="fl i_ser_tit"><h2 class="ser_h2">最新开服表</h2></div>
                  <!--<a href="javascript:;" class="icon ser_more"></a>-->
                </div>
       	    <div class="i_top_s">
              
                	<div class="i_top_simg"><a href="http://qjll.6998.com" title="双线1区" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/qjll3.jpg" width="110" height="65"></a></div>
                    <div class="i_top_sfont">
                    	<h2><a href="http://qjll.6998.com" target="_blank">奇迹来了</a></h2>
                        <span><a href="http://account.6998.com/mygame_login_qjll-60600441-0.html" target="_blank"></a></span>
                        <span class="red"><a href="http://account.6998.com/mygame_login_qjll-60600441-0.html" target="_blank">双线1区</a></span>
                    </div>
              
              </div>
              <div class="i_s_cont">
                  <ul>
                  	<li class="top_border">
                    	<div class="i_s_game"><h2>游戏区服</h2></div>
                        <div class="i_s_time i_pd">开服时间</div>
                        <div class="i_s_gift">礼包</div>
                    </li>                    
                    <li>
                    	<div class="i_s_game"><h2><a href="http://qjll.6998.com" title="奇迹来了" target="_blank">奇迹来了-</a></h2><span><a href="http://account.6998.com/mygame_login_qjll-60600441-0.html" title="双线1区" target="_blank">双线1区</a></span></div>
                        <div class="i_s_time">
                          05-15                                          
                     </div>
                      	<div class="i_s_gift"><a class="icon i_gift_img" title="点击领取礼包" href="/newbie/qjll?s=qjll1"></a></div>
                    </li>
                    <li>
                    	<div class="i_s_game"><h2><a href="http://xxd.6998.com/" title="仙侠道" target="_blank">仙侠道-</a></h2><span><a href="http://account.6998.com/mygame_login_xxd-57725620-0.html" title="飘渺仙境" target="_blank">飘渺仙境</a></span></div>
                        <div class="i_s_time">
                          05-08                                          
                     </div>
                      	<div class="i_s_gift"><a class="icon i_gift_img" title="点击领取礼包" href="/newbie/xxd?s=38"></a></div>
                    </li>
                    <li>
                    	<div class="i_s_game"><h2><a href="http://wy.6998.com/" title="武易传奇" target="_blank">武易传奇-</a></h2><span><a href="http://account.6998.com/mygame_login_wycq-59704761-0.html" title="双线6区" target="_blank">双线6区</a></span></div>
                        <div class="i_s_time">
                          05-07                                          
                     </div>
                      	<div class="i_s_gift"><a class="icon i_gift_img" title="点击领取礼包" href="/newbie/wycq?s=39"></a></div>
                    </li>
                    <li>
                    	<div class="i_s_game"><h2><a href="http://wy.6998.com/" title="武易传奇" target="_blank">武易传奇-</a></h2><span><a href="http://account.6998.com/mygame_login_wycq-57213241-0.html" title="双线5区" target="_blank">双线5区</a></span></div>
                        <div class="i_s_time">
                          04-24                                          
                     </div>
                      	<div class="i_s_gift"><a class="icon i_gift_img" title="点击领取礼包" href="/newbie/WYCQ?s=37"></a></div>
                    </li>
                    <li>
                    	<div class="i_s_game"><h2><a href="http://nslm.6998.com/" title="女神联盟" target="_blank">女神联盟-</a></h2><span><a href="http://account.6998.com/mygame_login_nslm-49233941-0.html" title="海天盛宴" target="_blank">海天盛宴</a></span></div>
                        <div class="i_s_time">
                          04-17                                          
                     </div>
                      	<div class="i_s_gift"><a class="icon i_gift_img" title="点击领取礼包" href="/newbie/nslm?s=nslm1"></a></div>
                    </li>
                    <li>
                    	<div class="i_s_game"><h2><a href="http://wy.6998.com/" title="武易传奇" target="_blank">武易传奇-</a></h2><span><a href="http://account.6998.com/mygame_login_wycq-53045401-0.html" title="双线4区" target="_blank">双线4区</a></span></div>
                        <div class="i_s_time">
                          04-15                                          
                     </div>
                      	<div class="i_s_gift"><a class="icon i_gift_img" title="点击领取礼包" href="/newbie/WYCQ?s=36"></a></div>
                    </li>
                    <li>
                    	<div class="i_s_game"><h2><a href="http://jjsg.6998.com/" title="街机三国" target="_blank">街机三国-</a></h2><span><a href="http://account.6998.com/mygame_login_jjsg-53-0.html" title="风林火山" target="_blank">风林火山</a></span></div>
                        <div class="i_s_time">
                          04-10                                          
                     </div>
                      	<div class="i_s_gift"><a class="icon i_gift_img" title="点击领取礼包" href="/newbie/jjsg?s=jjsg1"></a></div>
                    </li>
                    </ul>
              </div>
            </div>
            <!--开服列表内容结束-->
             <!--快速通道内容开始-->
            <div class="i_express">
            	<div class="i_ser_titbox">
                	<div class="fl i_ser_tit"><h2 class="ser_h2">快速通道</h2></div>
                  <a href="javascript:;" class="icon ser_more"></a>
                </div>
             	<div class="i_expcont">
                	<ul>
                    	<li><a class="icon ex_ch_passwprd" href="http://account.6998.com/?open=password" title="修改密码" target="_blank">修改密码</a></li>
                        <li><a class="icon ex_passwprd_recov" href="http://account.6998.com/RetrevePwd/Index" title="密码找回" target="_blank">密码找回</a></li>
                        <li><a class="icon ex_mobile" href="http://account.6998.com/?open=mobile" title="绑定手机" target="_blank">绑定手机</a></li>
                        <li><a class="icon ex_email" href="http://account.6998.com/?open=email" title="绑定邮箱" target="_blank">绑定邮箱</a></li>
                        <li><a class="icon ex_reg" href="http://account.6998.com/Reg?method=pt&from=20452" title="注册用户" target="_blank">注册用户</a></li>
                        <li><a class="icon ex_pay" href="http://pay.6998.com/" title="充值游戏" target="_blank">充值游戏</a></li>
                        <li><a class="icon ex_custody" href="/jksq" title="家长监护" target="_blank">家长监护</a></li>
                        <li><a class="icon ex_anti" href="http://account.6998.com/?open=realnameinfo" title="防沉迷验证" target="_blank">防沉迷验证</a></li>
                    </ul>
                </div>
            </div>
            <!--快速通道内容结束-->
             <!--客服中心内容开始-->
            <div class="i_ser_center">
            	<div class="i_ser_titbox">
                	<div class="fl i_ser_tit"><h2 class="ser_h2">客服中心</h2></div>
                    <a href="http://kf.uc55.com/" class="icon ser_more"  target="_blank"></a>
                </div>
             	<div class="i_sercont">
                	<div class="fl i_serc_l"><a class="but i_serc_img" href="#"></a></div>
                    <div class="fl i_serc_r">
                    	<div class="i_serc_f">
                        	<a  target="_blank" class="but ser_online" title="" href="http://www.6998cdn.com/uc55_2014/kf.htm?arg=uc55&style=1&kflist=off&kf=&zdkf_type=1&language=cn&charset=GBK&lytype=0&referer=http%3A%2F%2Fsz.uc55.com%2Fclient%2F&keyword=&tpl=crystal_blue">在线客服</a><span>7X24</span>
                            <h3  target="_blank" class="p_t_h"><a title="" href="http://www.6998cdn.com/uc55_2014/kf.htm?arg=uc55&style=1&kflist=off&kf=&zdkf_type=1&language=cn&charset=GBK&lytype=0&referer=http%3A%2F%2Fsz.uc55.com%2Fclient%2F&keyword=&tpl=crystal_blue">有什么问题客服来帮您</a></h3>
                        </div>
                        <div class="i_serc_f ser_p_t">
                        	<font>客服电话</font><span>7X24</span>
                            <h3>400-017-6188</h3>
                        </div>
                        <h4 class="minor_f"><a href="/jksq" target="_blank">未成年人家长监护工程</a></h4>
                    </div>
                </div>
            </div>
            <!--客服中心内容结束-->       
    	</div>
        <!--内容左边结束-->
        <!--内容右边开始-->
        <div class="fr cont_r">
        	<!--火爆游戏开始-->
            <div class="i_pop_game">
           	  <h2 class="i_pop_tit">火爆游戏</h2>
                <div class="i_popcont">
                	<ul>
                      

                    	<li>
                        	<span class="but pop_ico"></span>
                          <p><a href="qjll.6998.com"><img src="/Cms_Data/Contents/MainDB/Media/game/qjll1.jpg"></a></p>
                            <div id="pop_over">
                            	<a class="i_ent" href="http://account.6998.com/mygame_login_qjll-60600441-0.html" target="_blank">进入游戏</a>
                                <a class="i_ent" href="qjll.6998.com" target="_blank">进入官网</a>
                              
                            </div>
                        </li>  
                    	<li>
                        	<span class="but pop_ico"></span>
                          <p><a href="http://xxd.6998.com/"><img src="/Cms_Data/Contents/MainDB/Media/game/xxd1.jpg"></a></p>
                            <div id="pop_over">
                            	<a class="i_ent" href="http://account.6998.com/mygame_login_xxd-57725620-0.html" target="_blank">进入游戏</a>
                                <a class="i_ent" href="http://xxd.6998.com/" target="_blank">进入官网</a>
                              
                            </div>
                        </li>  
                    	<li>
                        	<span class="but pop_ico"></span>
                          <p><a href="http://wy.6998.com/"><img src="/Cms_Data/Contents/MainDB/Media/game/-01FEDE9D-81F4-49B3-A2B2-E0FDBA32FFA0-.jpg"></a></p>
                            <div id="pop_over">
                            	<a class="i_ent" href="http://account.6998.com/mygame_login_wycq-52-0.html" target="_blank">进入游戏</a>
                                <a class="i_ent" href="http://wy.6998.com/" target="_blank">进入官网</a>
                              
                            </div>
                        </li>  
                     
                    </ul>
                </div>
          </div>
            <!--火爆游戏结束-->
            <!--热门游戏开始-->
            <div class="i_hot_game">
           	  <h2 class="i_hot_tit">热门游戏</h2>
              <div class="i_hotcont">
              	<ul>
                  
              

                  	<li>
                    	<a href="http://nslm.6998.com/" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/nslm2.jpg"></a>
                        <div class="fl i_hcont_r">
                        	<h2><a href="http://nslm.6998.com/" target="_blank">女神联盟</a></h2>
                            <p>角色扮演</p>
                            <a class="but i_h_but" href="http://account.6998.com/mygame_login_nslm-0-0.html" target="_blank">进入游戏</a>
                        </div>
                    </li>
                  	<li>
                    	<a href="http://jjsg.6998.com/" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/jjsg2.jpg"></a>
                        <div class="fl i_hcont_r">
                        	<h2><a href="http://jjsg.6998.com/" target="_blank">街机三国</a></h2>
                            <p>角色扮演</p>
                            <a class="but i_h_but" href="http://account.6998.com/mygame_login_jjsg-0-0.html" target="_blank">进入游戏</a>
                        </div>
                    </li>
                  	<li>
                    	<a href="http://gcld.6998.com/" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/gc2.jpg"></a>
                        <div class="fl i_hcont_r">
                        	<h2><a href="http://gcld.6998.com/" target="_blank">攻城掠地</a></h2>
                            <p>角色扮演</p>
                            <a class="but i_h_but" href="http://account.6998.com/mygame_login_gcld-0-0.html" target="_blank">进入游戏</a>
                        </div>
                    </li>
                  	<li>
                    	<a href="http://minigame.6998.com/fish/" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/remen-2-by.jpg"></a>
                        <div class="fl i_hcont_r">
                        	<h2><a href="http://minigame.6998.com/fish/" target="_blank">捕鱼冠军</a></h2>
                            <p>休闲游戏</p>
                            <a class="but i_h_but" href="http://account.6998.com/mygame_login_wg-8-1.html" target="_blank">进入游戏</a>
                        </div>
                    </li>
                  	<li>
                    	<a href="http://sxd.6998.com" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/remen-6-shenxiandao.jpg"></a>
                        <div class="fl i_hcont_r">
                        	<h2><a href="http://sxd.6998.com" target="_blank">神仙道</a></h2>
                            <p>角色扮演</p>
                            <a class="but i_h_but" href="http://account.6998.com/mygame_login_sxd-0-0.html" target="_blank">进入游戏</a>
                        </div>
                    </li>
                  	<li>
                    	<a href="http://astd.6998.com/" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/remen-5-aoshi.jpg"></a>
                        <div class="fl i_hcont_r">
                        	<h2><a href="http://astd.6998.com/" target="_blank">傲视天地</a></h2>
                            <p>战争策略</p>
                            <a class="but i_h_but" href="http://account.6998.com/mygame_login_astd-6-0.html" target="_blank">进入游戏</a>
                        </div>
                    </li>
                 
                </ul> 
              </div>
              <div class="clear"></div>
          </div>
            <!--热门游戏结束-->
             <!--其他游戏开始-->
            <div class="i_oth_game">
           	  <h2 class="i_hot_tit">其他游戏</h2>
              <a class="icon other_more" href="http://www.6998.com/game"></a>
             <div class="i_othcont">
             	<ul>
                	<li>
                    	<a href="qjll.6998.com" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/qjll2.jpg"></a>
                        <h2><a href="qjll.6998.com" target="_blank">奇迹来了</a></h2>
                    </li>      
                	<li>
                    	<a href="http://xxd.6998.com/" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/xxd2.jpg"></a>
                        <h2><a href="http://xxd.6998.com/" target="_blank">仙侠道</a></h2>
                    </li>      
                	<li>
                    	<a href="http://nslm.6998.com/" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/nslm2.jpg"></a>
                        <h2><a href="http://nslm.6998.com/" target="_blank">女神联盟</a></h2>
                    </li>      
                	<li>
                    	<a href="http://wy.6998.com/" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/-509B3AFF-2BE0-40DC-9E30-7E454BDC8A98-.jpg"></a>
                        <h2><a href="http://wy.6998.com/" target="_blank">武易传奇</a></h2>
                    </li>      
                	<li>
                    	<a href="http://jjsg.6998.com/" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/jjsg2.jpg"></a>
                        <h2><a href="http://jjsg.6998.com/" target="_blank">街机三国</a></h2>
                    </li>      
                	<li>
                    	<a href="http://gcld.6998.com/" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/gc2.jpg"></a>
                        <h2><a href="http://gcld.6998.com/" target="_blank">攻城掠地</a></h2>
                    </li>      
                	<li>
                    	<a href="http://minigame.6998.com/fish/" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/remen-2-by.jpg"></a>
                        <h2><a href="http://minigame.6998.com/fish/" target="_blank">捕鱼冠军</a></h2>
                    </li>      
                	<li>
                    	<a href="http://sxd.6998.com" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/remen-6-shenxiandao.jpg"></a>
                        <h2><a href="http://sxd.6998.com" target="_blank">神仙道</a></h2>
                    </li>      
                	<li>
                    	<a href="http://astd.6998.com/" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/remen-5-aoshi.jpg"></a>
                        <h2><a href="http://astd.6998.com/" target="_blank">傲视天地</a></h2>
                    </li>      
                	<li>
                    	<a href="http://www.uc55.com" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/remen-3-tr.jpg"></a>
                        <h2><a href="http://www.uc55.com" target="_blank">唐人游</a></h2>
                    </li>      
                	<li>
                    	<a href="http://www.uc55.com/game/detail/xiaoxiaole.html" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/1-14011G5514Y58.png"></a>
                        <h2><a href="http://www.uc55.com/game/detail/xiaoxiaole.html" target="_blank">消消乐</a></h2>
                    </li>      
                	<li>
                    	<a href="http://www.uc55.com/game/detail/guangdan.html" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/guandan.png"></a>
                        <h2><a href="http://www.uc55.com/game/detail/guangdan.html" target="_blank">掼蛋</a></h2>
                    </li>      
                	<li>
                    	<a href="http://www.uc55.com/game/detail/junqi.html" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/1-14011G55143a4.png"></a>
                        <h2><a href="http://www.uc55.com/game/detail/junqi.html" target="_blank">军棋</a></h2>
                    </li>      
                	<li>
                    	<a href="http://www.uc55.com/game/detail/wuziqi.html" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/www.png"></a>
                        <h2><a href="http://www.uc55.com/game/detail/wuziqi.html" target="_blank">五子棋</a></h2>
                    </li>      
                	<li>
                    	<a href="http://www.uc55.com/game/detail/taiqiu.html" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/zq.png"></a>
                        <h2><a href="http://www.uc55.com/game/detail/taiqiu.html" target="_blank">桌球</a></h2>
                    </li>      
                	<li>
                    	<a href="http://www.uc55.com/game/detail/trpaopao.html" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/1-14011G55105942.png"></a>
                        <h2><a href="http://www.uc55.com/game/detail/trpaopao.html" target="_blank">唐人泡泡</a></h2>
                    </li>      
                	<li>
                    	<a href="http://www.uc55.com/game/detail/sirendoudizhu.html" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/srddz.png"></a>
                        <h2><a href="http://www.uc55.com/game/detail/sirendoudizhu.html" target="_blank">四人斗地主</a></h2>
                    </li>      
                	<li>
                    	<a href="http://www.uc55.com/game/detail/xiangqi.html" target="_blank"><img src="/Cms_Data/Contents/MainDB/Media/game/1-14011G55420Z4.png"></a>
                        <h2><a href="http://www.uc55.com/game/detail/xiangqi.html" target="_blank">中国象棋</a></h2>
                    </li>      
                </ul>
             </div>
              <div class="clear"></div>
          </div>
            <!--其他游戏结束-->
        </div>
        <!--内容右边结束--> 
        <div class="clear"></div>
    </div>
</div>
<!--网站内容结束-->
<input type="hidden" value="0" id="pos_inp" />
 <!--网站页脚开始-->
<div class="bottom">
	<div class="wrap">
    	<!--
<h4 class="bot_h">
        	<a href="#">唐人简介</a>   |   
            <a href="#">旗下游戏</a>   |   
            <a href="#">招贤纳才</a>   |   
            <a href="#">联系我们</a>   |   
            <a href="#">法律声明</a>   |   
            <a href="#">设为首页</a>   |    
            <a href="#">加入收藏</a>
        </h4>
-->
        <p class="bot_p">
          Copyright © 2005 - 2015 唐人游 苏ICP备09011633号<br>
          <a href="http://www.6998cdn.com/zhengshu/jyxkz.jpg" target="_blank">《网络文化经营许可证》</a>
          《中华人民共和国增值电信业务经营许可证》 编号：苏 B2-20120317          
          <a href="http://www.6998cdn.com/zhengshu/icp.jpg" target="_blank">《中华人民共和国增值电信业务经营许可证》</a> 编号：苏 B2-20120317 
          <a href="http://www.6998cdn.com/zhengshu/cbxkz.jpg" target="_blank">《中华人民共和国互联网出版许可证》</a> 新出网证(苏)字0012号<br>投诉邮箱：gm#uc55.com(防止垃圾邮件，发邮件时请将#改为@)
      </p>
    </div>
</div>



<!--网站页脚结束-->
<script src="http://sg.6998cdn.com/skin2013v2/js/jquery.1.7.1.min.js"  type="text/javascript"></script>
<script src="  http://www.6998cdn.com/common/login_newbie.js"></script>
<script src="http://www.6998cdn.com/mini/miniLoginSdk.js?v=20140324"  type="text/javascript"></script>


<script src="/Cms_Data/Contents/MainDB/Media/skin/js/base.js"  type="text/javascript"></script>



<script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-56635-7']);
            _gaq.push(['_setDomainName', '6998.com']);
            _gaq.push(['_addOrganic', 'baidu', 'word']);
            _gaq.push(['_addOrganic', 'soso', 'w']);
            _gaq.push(['_addOrganic', '3721', 'name']);
            _gaq.push(['_addOrganic', 'youdao', 'q']);
            _gaq.push(['_addOrganic', 'vnet', 'kw']);
            _gaq.push(['_addOrganic', 'sogou', 'query']);
            _gaq.push(['_addIgnoredOrganic', '6998']);
            _gaq.push(['_addIgnoredOrganic', 'www.6998.com']);
            _gaq.push(['_trackPageview']);
            _gaq.push(['_trackPageLoadTime']);
            (function() {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();
        </script>


</body>
</html>