(function() {
	/**
	 * 所有类的基类，提供继承机制
	 */
	var initializing = false, fnTest = /xyz/.test(function() {xyz;}) ? /\b_super\b/ : /.*/;
	this.Class = function() {};
	Class.extend = function(prop) {
		var _super = this.prototype;
		initializing = true;
		var prototype = new this();
		initializing = false;
		for ( var name in prop) {
			prototype[name] = typeof prop[name] == "function" 
					&& typeof _super[name] == "function" && fnTest.test(prop[name]) ? 
				(function(name, fn) {
					return function() {
						var tmp = this._super;

						this._super = _super[name];

						var ret = fn.apply(this, arguments);
						this._super = tmp;

						return ret;
					};
				})(name, prop[name]) : prop[name];
		}
		function Class() {
			if (!initializing && this.init)
				this.init.apply(this, arguments);
		}
		Class.prototype = prototype;
		Class.prototype.constructor = Class;
		Class.extend = arguments.callee;
		return Class;
	};
})();
var validate = Class
		.extend({
			defaultCfg:{
				rules:{},
				submitFun:function(){},
				errorLabel:'<label style="color:red"></label>',
				errorFun:function(){}
			},
			init:function(cfg){				
				this.cfg = $.extend({},this.defaultCfg,cfg);
				this.flag=0;
				this.toAction(this);
				if(this.flag==0){
					for(var i in this.cfg.rules){
						$("#"+i).unbind("keyup");
					}
					this.cfg.submitFun();
				}
			},
			toAction:function(that){				
				for(var i in that.cfg.rules){
					this.toVal("#"+i,that.cfg.rules[i]);
				}
			},
			toVal:function(ele,constant){
				validateConstant[constant].test($(ele).val())?
					this.toRemoveError(ele):this.toShowError(ele,errorMsg[constant]);

			},
			toRemoveError:function(ele){
				var that = this;
				if($(ele).closest(".form-group").attr("not-allow")){
					$(ele).removeAttr("style").closest(".form-group").removeAttr("style")
							.removeAttr("not-allow");
					$(ele).next().remove();		
					$(ele).keyup(function(){
						ele = ele.replace("#","");
						that.toVal("#"+ele,that.cfg.rules[ele]);
					});							
				}				
			},
			toShowError:function(ele,message){
				var error = $(this.cfg.errorLabel).text(message);
				if(!$(ele).closest(".form-group").attr("not-allow")){
					$(ele).after(error);
					$(ele).css("border","1px solid red").closest(".form-group")
							.css("color","red").attr("not-allow","true");
					$(ele).keyup(function(){
						ele = ele.replace("#","");
						that.toVal("#"+ele,that.cfg.rules[ele]);
					});
				}	
				this.flag++;	
				var that = this;			
				
			}
		})
var validateConstant = {
	"notEmpty" : /^.+$/,// 合法字符
	"password" : /^[0-9A-Za-z]{1,18}$/,// 密码
	"rightfulString" : /^[A-Za-z0-9_-]+$/,// 合法字符
	"number" : /^\d+$/,// 数字
	"endlish" : /^[A-Za-z]+$/,// 纯英文
	"numberEnglish" : /^[A-Za-z0-9]+$/,// 英文和数字
	"float" : /^[+]?\d+(\.\d+)?$/,// 浮点型
	"money" : /(^[1-9]\d{0,9}(\.\d{1,2})?$)/,
	"chinese" : "/^[\u4e00-\u9fa5]+$/",// 纯中文
	"mobile" : /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1})|(14[0-9]{1}))+\d{8})$/,// 手机号
	"tel" : /^(\d{3,4}-?)?\d{7,9}$/g,// 电话
	"qq" : /^[1-9]\d{4,12}$/,// qq
	"zipCode" : /^[0-9]{6}$/,// 邮政编码
	"email" : /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/,// 邮箱
	"positive":/^[1-9][0-9]+$/,//大于0的数字
	"checkIdCard" : function(idcard) {// 校验身份证
		var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",
				37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",
				63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"} 
		var idcard,Y,JYM; 
		var S,M; 
		var idcard_array = new Array(); 
		idcard_array = idcard.split(""); 
		
		//地区检验 
		if(area[parseInt(idcard.substr(0,2))]==null){
			return false; 
		}
		//身份号码位数及格式检验 
		switch(idcard.length){ 
			case 15: 
				if ( (parseInt(idcard.substr(6,2))+1900) % 4 == 0 || ((parseInt(idcard.substr(6,2))+1900) % 100 == 0 && (parseInt(idcard.substr(6,2))+1900) % 4 == 0 )){ 
					ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;
					//测试出生日期的合法性 
				} else { 
					ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;
					//测试出生日期的合法性 
				} 
		
				if(ereg.test(idcard)){ 
					return true; 
				}else{ 
					return false;
				}
				break; 
			case 18: 
				//18位身份号码检测 
				//出生日期的合法性检查 
				//闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9])) 
				//平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8])) 
				if ( parseInt(idcard.substr(6,4)) % 4 == 0 || (parseInt(idcard.substr(6,4)) % 100 == 0 && parseInt(idcard.substr(6,4))%4 == 0 )){ 
					ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;
					//闰年出生日期的合法性正则表达式 
				} else { 
					ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;
					//平年出生日期的合法性正则表达式 
				} 
				if(ereg.test(idcard)){//测试出生日期的合法性 
					//计算校验位 
					S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7 + (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9 
					+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10 + (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5 
					+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8 + (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4 
					+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2 + parseInt(idcard_array[7]) * 1 + parseInt(idcard_array[8]) * 6 
					+ parseInt(idcard_array[9]) * 3 ; 
					Y = S % 11; 
					M = "F"; 
					JYM = "10X98765432"; 
					M = JYM.substr(Y,1);//判断校验位 
					if(M == idcard_array[17].toUpperCase()) {
						return true; //检测ID的校验位 
					}else{
						return false;
					}
				}else{
					return false;
				}
				break; 
			default: 
				return false; 
				break; 
		} 
	}
}
var errorMsg = {
	"notEmpty" : "不能为空",
	"password" : "请输入正确的密码",
	"rightfulString" : "请输入合法字符",// 合法字符
	"number" : "只能输入数字",// 数字
	"endlish" : "只能输入英文",// 纯英文
	"numberEnglish" : "只能输入英文或数字",// 英文和数字
	"float" : "只能输入小数",// 浮点型
	"money" : "请输入合法价格",
	"chinese" : "只能输入汉字",// 纯中文
	"mobile" : "请输入正确的手机号",// 手机号
	"tel" : "请输入正确的电话号码",// 电话
	"qq" : "请输入正确的QQ号",// qq
	"zipCode" : "请输入正确的QQ号",
	"email" : "请输入正确的邮箱",// 邮箱
	"positive":"请输入大于0的数字",//大于0的数字
	"checkIdCard" : "请输入正确的身份证号"// 校验身份证
}