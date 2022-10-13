/**
 * 회원정보의 유효성 판단처리
 */
var member = {
	//키보드입력시 입력값 태그별 상태확인
	tag_status: function( tag ){
		var name = tag.attr('name');
		if( name=='pw' )  return this.userpw_status( tag.val() );
		else if( name=='pw_ck' ) return this.userpw_ck_status( tag.val() );
		else if( name=='name' )	return this.name_status( tag.val() );
	},
	
	//이름 유효성 검사
	name_status: function(name){
		var reg = /^[가-힣]{2,6}$/;
		if( name == '')				return this.common.empty;
		else if( reg.test(name))	return this.name.valid;
		else 						return this.name.invalid;
	},
	
	name: {
		valid: { code:'valid', desc:'사용가능한 이름' },
		invalid: { code:'invalid', desc:'유효하지 않은 이름' }
	},
	
	
	
	
	
	//비밀번호확인 입력값 상태확인: 비밀번호와 입력값이 동일한지
	userpw_ck_status: function(pw_ck){
		if( pw_ck=='' )								return this.common.empty;
		else if( pw_ck==$('[name=pw]').val() ) 	return this.userpw.equal;
		else									return this.userpw.notEqual;
	},
	
	//비밀번호입력값 상태확인: 영문 대.소문자, 숫자를 모두 포함
	userpw_status: function( pw ){
		var reg = /(?=.*[0-9])(?=.*[a-z])(?=.*\W)(?=\S+$).{8,20}/;
		if( pw=='' )						return this.common.empty;
		else if( pw.match(this.space) )		return this.common.space;
		else if( reg.test(pw) )				return this.userpw.invalid;
		else if( pw.length<5 )				return this.common.min;
		else if( pw.length>15 )				return this.common.max;
		else								return this.userpw.valid;
	},
	
	//비밀번호관련 상태값
	userpw: {
		equal: { code:'valid', desc:'비밀번호가 일치' },
		notEqual: { code:'invalid', desc:'비밀번호가 일치하지 않습니다' },
		valid: { code:'valid', desc:'사용가능한 비밀번호' },
		invalid: { code:'invalid', desc:'영문 대/소문자,숫자만 입력' },
		lack: { code:'invalid', desc:'영문 대/소문자,숫자를 모두 포함'}
	},
	
	space: /\s/g,
	
	//공통사용 상태값
	common: {
		empty: { code:'invalid', desc:'입력하세요' },
		space: { code:'invalid', desc:'공백없이 입력하세요' },
		min: { code:'invalid', desc:'5자이상 입력하세요' },
		max: { code:'invalid', desc:'15자이내 입력하세요' }
	}
} 