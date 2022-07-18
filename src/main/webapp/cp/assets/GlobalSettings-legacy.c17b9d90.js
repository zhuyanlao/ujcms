!function(){var e=document.createElement("style");e.innerHTML=".el-tabs[data-v-5a5c1dd5] .el-tabs__header{float:right;margin-right:1px}\n",document.head.appendChild(e),System.register(["./vendor-legacy.c673f215.js","./tree-legacy.a39fb697.js","./system-legacy.83eabbec.js","./config-legacy.9c873c89.js","./index-legacy.bb3d5eb8.js","./LabelTip-legacy.f517ffd0.js","./FieldItem-legacy.8c5de300.js","./content-legacy.de5344a2.js","./BaseUpload.vue_vue_type_style_index_0_scoped_true_lang-legacy.e1aede23.js"],(function(e){"use strict";var l,a,u,s,t,d,o,r,p,n,m,i,g,c,f,v,V,y,_,h,b,x,w,U,q,k,$,M,L,S,T,I,K,D,A,R,C,j,H,N,P,W,E,F,O,z,B;return{setters:[function(e){l=e.g,a=e.u,u=e.I,s=e.i,t=e.M,d=e.j,o=e.N,r=e.o,p=e.k,n=e.w,m=e.l,i=e.q,g=e.C,c=e.F,f=e.O,v=e.m,V=e.y,y=e.x,_=e.P,h=e.A,b=e.K,x=e.Q,w=e.e},function(e){U=e.t},function(e){q=e.h},function(e){k=e.h,$=e.j,M=e.k,L=e.l,S=e.m,T=e.n,I=e.o,K=e.p,D=e.r,A=e.s,R=e.t,C=e.w,j=e.x,H=e.y,N=e.z},function(e){P=e._,W=e.D,E=e.h,F=e.m,O=e.E},function(e){z=e._},function(e){B=e._},function(){},function(){}],execute:function(){const G=["innerHTML"],J={key:7};e("default",P(l({name:"GlobalSettings",setup(e){const{t:l}=a(),P=u(),Q=u({}),X=u({}),Y=u(!1),Z=u(!1),ee=u([]),le=u(),ae=s((()=>{var e;return JSON.parse((null===(e=le.value)||void 0===e?void 0:e.customs)||"[]")})),ue=[];W("config:base:update")&&ue.push("base"),W("config:upload:update")&&ue.push("upload"),W("config:security:update")&&(E.epRank>=1||E.epDisplay)&&ue.push("security"),W("config:sms:update")&&ue.push("sms"),W("config:uploadStorage:update")&&ue.push("uploadStorage"),W("config:htmlStorage:update")&&ue.push("htmlStorage"),W("config:templateStorage:update")&&ue.push("templateStorage"),W("config:customs:update")&&ue.push("customs");const se=u(ue[0]),te=async e=>{X.value="upload"===e?Q.value.upload:"security"===e?Q.value.security:"customs"===e?Q.value.customs:"sms"===e?await M():"uploadStorage"===e?await L():"htmlStorage"===e?await S():"templateStorage"===e?await T():Q.value},de=async()=>{le.value=await k()},oe=async()=>{Q.value=await $(),te(se.value)},re=async()=>{ee.value=U(await q())};t((async()=>{Y.value=!0;try{await Promise.all([oe(),de(),re()])}finally{Y.value=!1}}));const pe=async()=>{Y.value=!0;try{await oe()}finally{Y.value=!1}};return(e,a)=>{const u=d("el-tab-pane"),s=d("el-tabs"),t=d("el-aside"),U=d("el-input"),q=d("el-form-item"),k=d("el-col"),$=d("el-input-number"),M=d("el-row"),L=d("el-alert"),S=d("el-option"),T=d("el-select"),W=d("el-divider"),Q=d("el-switch"),le=d("el-radio-button"),de=d("el-radio-group"),oe=d("el-tree-select"),re=d("el-button"),ne=d("el-form"),me=d("el-main"),ie=d("el-container"),ge=o("loading");return r(),p(ie,null,{default:n((()=>[m(t,{width:"180px",class:"pr-3"},{default:n((()=>[m(s,{modelValue:se.value,"onUpdate:modelValue":a[0]||(a[0]=e=>se.value=e),onTabClick:a[1]||(a[1]=({paneName:e})=>te(e)),"tab-position":"left",stretch:"",class:"bg-white"},{default:n((()=>[(r(),i(c,null,g(ue,(l=>m(u,{key:l,name:l,label:e.$t(`config.settings.${l}`)},null,8,["name","label"]))),64))])),_:1},8,["modelValue"])])),_:1}),m(me,{class:"p-3 app-block"},{default:n((()=>[f((r(),p(ne,{ref_key:"form",ref:P,model:X.value,"label-width":"160px"},{default:n((()=>{var u;return["upload"===se.value?(r(),p(M,{key:0},{default:n((()=>[m(k,{span:12},{default:n((()=>[m(q,{prop:"imageTypes",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.upload.imageTypes",help:""})])),default:n((()=>[m(U,{modelValue:X.value.imageTypes,"onUpdate:modelValue":a[2]||(a[2]=e=>X.value.imageTypes=e),maxlength:"255"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"imageLimit",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.upload.imageLimit",help:""})])),default:n((()=>[m($,{modelValue:X.value.imageLimit,"onUpdate:modelValue":a[3]||(a[3]=e=>X.value.imageLimit=e),min:0,max:65535},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"videoTypes",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.upload.videoTypes",help:""})])),default:n((()=>[m(U,{modelValue:X.value.videoTypes,"onUpdate:modelValue":a[4]||(a[4]=e=>X.value.videoTypes=e),maxlength:"255"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"videoLimit",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.upload.videoLimit",help:""})])),default:n((()=>[m($,{modelValue:X.value.videoLimit,"onUpdate:modelValue":a[5]||(a[5]=e=>X.value.videoLimit=e),min:0,max:65535},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"audioTypes",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.upload.audioTypes",help:""})])),default:n((()=>[m(U,{modelValue:X.value.audioTypes,"onUpdate:modelValue":a[6]||(a[6]=e=>X.value.audioTypes=e),maxlength:"255"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"audioLimit",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.upload.audioLimit",help:""})])),default:n((()=>[m($,{modelValue:X.value.audioLimit,"onUpdate:modelValue":a[7]||(a[7]=e=>X.value.audioLimit=e),min:0,max:65535},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"libraryTypes",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.upload.libraryTypes",help:""})])),default:n((()=>[m(U,{modelValue:X.value.libraryTypes,"onUpdate:modelValue":a[8]||(a[8]=e=>X.value.libraryTypes=e),maxlength:"255"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"libraryLimit",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.upload.libraryLimit",help:""})])),default:n((()=>[m($,{modelValue:X.value.libraryLimit,"onUpdate:modelValue":a[9]||(a[9]=e=>X.value.libraryLimit=e),min:0,max:65535},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"docTypes",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.upload.docTypes",help:""})])),default:n((()=>[m(U,{modelValue:X.value.docTypes,"onUpdate:modelValue":a[10]||(a[10]=e=>X.value.docTypes=e),maxlength:"255"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"docLimit",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.upload.docLimit",help:""})])),default:n((()=>[m($,{modelValue:X.value.docLimit,"onUpdate:modelValue":a[11]||(a[11]=e=>X.value.docLimit=e),min:0,max:65535},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"fileTypes",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.upload.fileTypes",help:""})])),default:n((()=>[m(U,{modelValue:X.value.fileTypes,"onUpdate:modelValue":a[12]||(a[12]=e=>X.value.fileTypes=e),maxlength:"255"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"fileLimit",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.upload.fileLimit",help:""})])),default:n((()=>[m($,{modelValue:X.value.fileLimit,"onUpdate:modelValue":a[13]||(a[13]=e=>X.value.fileLimit=e),min:0,max:65535},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"imageMaxWidth",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.upload.imageMaxWidth",help:""})])),default:n((()=>[m($,{modelValue:X.value.imageMaxWidth,"onUpdate:modelValue":a[14]||(a[14]=e=>X.value.imageMaxWidth=e),min:0,max:65535},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"imageMaxHeight",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.upload.imageMaxHeight",help:""})])),default:n((()=>[m($,{modelValue:X.value.imageMaxHeight,"onUpdate:modelValue":a[15]||(a[15]=e=>X.value.imageMaxHeight=e),min:0,max:65535},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1})])),_:1})):"security"===se.value&&v(E).epRank<1?(r(),p(L,{key:1,type:"warning",closable:!1,"show-icon":!0},{title:n((()=>[V("span",{innerHTML:e.$t("error.enterprise")},null,8,G)])),_:1})):"security"===se.value&&v(E).epRank>=1?(r(),p(M,{key:2},{default:n((()=>[m(k,{span:24},{default:n((()=>[m(q,{prop:"passwordStrength"},{label:n((()=>[m(z,{message:"config.security.passwordStrength"})])),default:n((()=>[m(T,{modelValue:X.value.passwordStrength,"onUpdate:modelValue":a[16]||(a[16]=e=>X.value.passwordStrength=e),class:"w-full"},{default:n((()=>[(r(),i(c,null,g([0,1,2,3,4],(l=>m(S,{key:l,value:l,label:e.$t(`config.security.passwordStrength.${l}`)},null,8,["value","label"]))),64))])),_:1},8,["modelValue"])])),_:1})])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"passwordMinLength"},{label:n((()=>[m(z,{message:"config.security.passwordMinLength",help:""})])),default:n((()=>[m($,{modelValue:X.value.passwordMinLength,"onUpdate:modelValue":a[17]||(a[17]=e=>X.value.passwordMinLength=e),min:0,max:16},null,8,["modelValue"])])),_:1})])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"passwordMaxLength"},{label:n((()=>[m(z,{message:"config.security.passwordMaxLength",help:""})])),default:n((()=>[m($,{modelValue:X.value.passwordMaxLength,"onUpdate:modelValue":a[18]||(a[18]=e=>X.value.passwordMaxLength=e),min:16,max:128},null,8,["modelValue"])])),_:1})])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"userMaxAttempts"},{label:n((()=>[m(z,{message:"config.security.userMaxAttempts",help:""})])),default:n((()=>[m($,{modelValue:X.value.userMaxAttempts,"onUpdate:modelValue":a[19]||(a[19]=e=>X.value.userMaxAttempts=e),min:0,max:100},null,8,["modelValue"])])),_:1})])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"userLockMinutes"},{label:n((()=>[m(z,{message:"config.security.userLockMinutes",help:""})])),default:n((()=>[m($,{modelValue:X.value.userLockMinutes,"onUpdate:modelValue":a[20]||(a[20]=e=>X.value.userLockMinutes=e),min:1,max:1440},null,8,["modelValue"])])),_:1})])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"ipCaptchaAttempts"},{label:n((()=>[m(z,{message:"config.security.ipCaptchaAttempts",help:""})])),default:n((()=>[m($,{modelValue:X.value.ipCaptchaAttempts,"onUpdate:modelValue":a[21]||(a[21]=e=>X.value.ipCaptchaAttempts=e),min:0,max:100},null,8,["modelValue"])])),_:1})])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"ipMaxAttempts"},{label:n((()=>[m(z,{message:"config.security.ipMaxAttempts",help:""})])),default:n((()=>[m($,{modelValue:X.value.ipMaxAttempts,"onUpdate:modelValue":a[22]||(a[22]=e=>X.value.ipMaxAttempts=e),min:0,max:999},null,8,["modelValue"])])),_:1})])),_:1}),v(E).epRank>=2||v(E).epDisplay?(r(),i(c,{key:0},[m(W,{"content-position":"left"}),m(k,{span:12},{default:n((()=>[m(q,{prop:"passwordMinDays"},{label:n((()=>[m(z,{message:"config.security.passwordMinDays",help:""})])),default:n((()=>[m($,{modelValue:X.value.passwordMinDays,"onUpdate:modelValue":a[23]||(a[23]=e=>X.value.passwordMinDays=e),min:0,max:998},null,8,["modelValue"])])),_:1})])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"passwordMaxDays"},{label:n((()=>[m(z,{message:"config.security.passwordMaxDays",help:""})])),default:n((()=>[m($,{modelValue:X.value.passwordMaxDays,"onUpdate:modelValue":a[24]||(a[24]=e=>X.value.passwordMaxDays=e),min:0,max:999},null,8,["modelValue"])])),_:1})])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"passwordWarnDays"},{label:n((()=>[m(z,{message:"config.security.passwordWarnDays",help:""})])),default:n((()=>[m($,{modelValue:X.value.passwordWarnDays,"onUpdate:modelValue":a[25]||(a[25]=e=>X.value.passwordWarnDays=e),min:0,max:90},null,8,["modelValue"])])),_:1})])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"passwordMaxHistory"},{label:n((()=>[m(z,{message:"config.security.passwordMaxHistory",help:""})])),default:n((()=>[m($,{modelValue:X.value.passwordMaxHistory,"onUpdate:modelValue":a[26]||(a[26]=e=>X.value.passwordMaxHistory=e),min:0,max:24},null,8,["modelValue"])])),_:1})])),_:1})],64)):y("",!0),v(E).epRank>=3||v(E).epDisplay?(r(),i(c,{key:1},[m(W,{"content-position":"left"}),m(k,{span:12},{default:n((()=>[m(q,{prop:"twoFactor"},{label:n((()=>[m(z,{message:"config.security.twoFactor",help:""})])),default:n((()=>[m(Q,{modelValue:X.value.twoFactor,"onUpdate:modelValue":a[27]||(a[27]=e=>X.value.twoFactor=e),disabled:v(E).epRank<3},null,8,["modelValue","disabled"])])),_:1})])),_:1})],64)):y("",!0)])),_:1})):"sms"===se.value?(r(),p(M,{key:3},{default:n((()=>[m(k,{span:12},{default:n((()=>[m(q,{prop:"provider",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.sms.provider"})])),default:n((()=>[m(de,{modelValue:X.value.provider,"onUpdate:modelValue":a[28]||(a[28]=e=>X.value.provider=e)},{default:n((()=>[(r(),i(c,null,g([0,1,2],(l=>m(le,{key:l,label:l},{default:n((()=>[_(h(e.$t(`config.sms.provider.${l}`)),1)])),_:2},1032,["label"]))),64))])),_:1},8,["modelValue"])])),_:1},8,["rules"])])),_:1}),0!==X.value.provider?(r(),i(c,{key:0},[m(k,{span:12},{default:n((()=>[m(q,{prop:"maxPerIp"},{label:n((()=>[m(z,{message:"config.sms.maxPerIp"})])),default:n((()=>[m($,{modelValue:X.value.maxPerIp,"onUpdate:modelValue":a[29]||(a[29]=e=>X.value.maxPerIp=e),min:1,max:99999},null,8,["modelValue"])])),_:1})])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"codeLength"},{label:n((()=>[m(z,{message:"config.sms.codeLength"})])),default:n((()=>[m($,{modelValue:X.value.codeLength,"onUpdate:modelValue":a[30]||(a[30]=e=>X.value.codeLength=e),min:4,max:6},null,8,["modelValue"])])),_:1})])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"codeExpires"},{label:n((()=>[m(z,{message:"config.sms.codeExpires",help:""})])),default:n((()=>[m($,{modelValue:X.value.codeExpires,"onUpdate:modelValue":a[31]||(a[31]=e=>X.value.codeExpires=e),min:3,max:30},null,8,["modelValue"])])),_:1})])),_:1}),1===X.value.provider?(r(),i(c,{key:0},[m(k,{span:12},{default:n((()=>[m(q,{prop:"accessKeyId",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.sms.accessKeyId"})])),default:n((()=>[m(U,{modelValue:X.value.accessKeyId,"onUpdate:modelValue":a[32]||(a[32]=e=>X.value.accessKeyId=e),maxlength:"128","show-password":""},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"accessKeySecret",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.sms.accessKeySecret"})])),default:n((()=>[m(U,{modelValue:X.value.accessKeySecret,"onUpdate:modelValue":a[33]||(a[33]=e=>X.value.accessKeySecret=e),maxlength:"128","show-password":""},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"templateCode",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.sms.templateCode"})])),default:n((()=>[m(U,{modelValue:X.value.templateCode,"onUpdate:modelValue":a[34]||(a[34]=e=>X.value.templateCode=e),maxlength:"32"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"codeName",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.sms.codeName"})])),default:n((()=>[m(U,{modelValue:X.value.codeName,"onUpdate:modelValue":a[35]||(a[35]=e=>X.value.codeName=e),maxlength:"20"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1})],64)):2===X.value.provider?(r(),i(c,{key:1},[m(k,{span:12},{default:n((()=>[m(q,{prop:"secretId",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.sms.secretId"})])),default:n((()=>[m(U,{modelValue:X.value.secretId,"onUpdate:modelValue":a[36]||(a[36]=e=>X.value.secretId=e),maxlength:"128","show-password":""},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"secretKey",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.sms.secretKey"})])),default:n((()=>[m(U,{modelValue:X.value.secretKey,"onUpdate:modelValue":a[37]||(a[37]=e=>X.value.secretKey=e),maxlength:"128","show-password":""},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"templateId",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.sms.templateId"})])),default:n((()=>[m(U,{modelValue:X.value.templateId,"onUpdate:modelValue":a[38]||(a[38]=e=>X.value.templateId=e),maxlength:"32"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"sdkAppId",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.sms.sdkAppId"})])),default:n((()=>[m(U,{modelValue:X.value.sdkAppId,"onUpdate:modelValue":a[39]||(a[39]=e=>X.value.sdkAppId=e),maxlength:"64"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"region",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.sms.region",help:""})])),default:n((()=>[m(U,{modelValue:X.value.region,"onUpdate:modelValue":a[40]||(a[40]=e=>X.value.region=e),maxlength:"64"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1})],64)):y("",!0),m(k,{span:12},{default:n((()=>[m(q,{prop:"signName",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.sms.signName",help:""})])),default:n((()=>[m(U,{modelValue:X.value.signName,"onUpdate:modelValue":a[41]||(a[41]=e=>X.value.signName=e),maxlength:"50"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(W,{"content-position":"left"},{default:n((()=>[_(h(e.$t("config.sms.test")),1)])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"testMobile"},{label:n((()=>[m(z,{message:"config.sms.testMobile"})])),default:n((()=>[m(U,{modelValue:X.value.testMobile,"onUpdate:modelValue":a[42]||(a[42]=e=>X.value.testMobile=e),maxlength:"30"},null,8,["modelValue"])])),_:1})])),_:1})],64)):y("",!0)])),_:1})):"uploadStorage"===se.value||"htmlStorage"===se.value||"templateStorage"===se.value?(r(),p(M,{key:4},{default:n((()=>[m(k,{span:24},{default:n((()=>[m(q,{prop:"type",rules:[{required:!0,message:()=>e.$t("v.required")},{validator:(l,a,u)=>{1===a&&v(E).epRank<1&&u(e.$t("error.enterprise.short")),u()}}]},{label:n((()=>[m(z,{message:"config.storage.type"})])),default:n((()=>[m(T,{modelValue:X.value.type,"onUpdate:modelValue":a[43]||(a[43]=e=>X.value.type=e),class:"w-full"},{default:n((()=>[(r(!0),i(c,null,g([0,1].filter((e=>1!==e||v(E).epRank>0||v(E).epDisplay)),(l=>(r(),p(S,{key:l,value:l,label:e.$t(`config.storage.type.${l}`)},null,8,["value","label"])))),128))])),_:1},8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:24},{default:n((()=>[m(q,{prop:"path",rules:{pattern:/^(?!.*\.\.).*$/,message:()=>e.$t("v.url")}},{label:n((()=>[m(z,{message:"config.storage.path"})])),default:n((()=>[m(U,{modelValue:X.value.path,"onUpdate:modelValue":a[44]||(a[44]=e=>X.value.path=e),maxlength:"160"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:24},{default:n((()=>[m(q,{prop:"url",rules:{pattern:/^(?!.*\.\.).*$/,message:()=>e.$t("v.url")}},{label:n((()=>[m(z,{message:"config.storage.url"})])),default:n((()=>[m(U,{modelValue:X.value.url,"onUpdate:modelValue":a[45]||(a[45]=e=>X.value.url=e),maxlength:"160"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),1===X.value.type?(r(),i(c,{key:0},[m(k,{span:24},{default:n((()=>[m(q,{prop:"endpoint",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.storage.endpoint"})])),default:n((()=>[m(U,{modelValue:X.value.endpoint,"onUpdate:modelValue":a[46]||(a[46]=e=>X.value.endpoint=e),maxlength:"160",disabled:v(E).epRank<1},null,8,["modelValue","disabled"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"region",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.storage.region"})])),default:n((()=>[m(U,{modelValue:X.value.region,"onUpdate:modelValue":a[47]||(a[47]=e=>X.value.region=e),maxlength:"160",disabled:v(E).epRank<1},null,8,["modelValue","disabled"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"bucket",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.storage.bucket"})])),default:n((()=>[m(U,{modelValue:X.value.bucket,"onUpdate:modelValue":a[48]||(a[48]=e=>X.value.bucket=e),maxlength:"160",disabled:v(E).epRank<1},null,8,["modelValue","disabled"])])),_:1},8,["rules"])])),_:1}),m(k,{span:24},{default:n((()=>[m(q,{prop:"accessKey",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.storage.accessKey"})])),default:n((()=>[m(U,{modelValue:X.value.accessKey,"onUpdate:modelValue":a[49]||(a[49]=e=>X.value.accessKey=e),type:"password","show-password":"",maxlength:"160",disabled:v(E).epRank<1},null,8,["modelValue","disabled"])])),_:1},8,["rules"])])),_:1}),m(k,{span:24},{default:n((()=>[m(q,{prop:"secretKey",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(z,{message:"config.storage.secretKey"})])),default:n((()=>[m(U,{modelValue:X.value.secretKey,"onUpdate:modelValue":a[50]||(a[50]=e=>X.value.secretKey=e),type:"password","show-password":"",maxlength:"160",disabled:v(E).epRank<1},null,8,["modelValue","disabled"])])),_:1},8,["rules"])])),_:1})],64)):y("",!0)])),_:1})):"customs"===se.value?(r(),p(M,{key:5},{default:n((()=>[(r(!0),i(c,null,g(v(ae),(l=>(r(),p(k,{key:l.code,span:l.double?12:24},{default:n((()=>[m(q,{prop:l.code,rules:l.required?{required:!0,message:()=>e.$t("v.required")}:void 0},{label:n((()=>[m(z,{label:l.name},null,8,["label"])])),default:n((()=>[m(B,{field:l,modelValue:X.value[l.code],"onUpdate:modelValue":e=>X.value[l.code]=e},null,8,["field","modelValue","onUpdate:modelValue"])])),_:2},1032,["prop","rules"])])),_:2},1032,["span"])))),128))])),_:1})):(r(),p(M,{key:6},{default:n((()=>[m(k,{span:12},{default:n((()=>[m(q,{prop:"port",rules:{type:"number",min:0,max:65535,message:()=>e.$t("v.range",{min:0,max:65535})}},{label:n((()=>[m(z,{message:"config.port",help:""})])),default:n((()=>[m(U,{modelValue:X.value.port,"onUpdate:modelValue":a[51]||(a[51]=e=>X.value.port=e),modelModifiers:{number:!0}},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"contextPath"},{label:n((()=>[m(z,{message:"config.contextPath",help:""})])),default:n((()=>[m(U,{modelValue:X.value.contextPath,"onUpdate:modelValue":a[52]||(a[52]=e=>X.value.contextPath=e),maxlength:"50"},null,8,["modelValue"])])),_:1})])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"channelUrl",rules:{pattern:/^\/[\w-]+$/,message:()=>e.$t("config.error.channelUrlPattern")}},{label:n((()=>[m(z,{message:"config.channelUrl",help:""})])),default:n((()=>[m(U,{modelValue:X.value.channelUrl,"onUpdate:modelValue":a[53]||(a[53]=e=>X.value.channelUrl=e),maxlength:"50"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"articleUrl"},{label:n((()=>[m(z,{message:"config.articleUrl",help:""})])),default:n((()=>[m(U,{modelValue:X.value.articleUrl,"onUpdate:modelValue":a[54]||(a[54]=e=>X.value.articleUrl=e),maxlength:"50"},null,8,["modelValue"])])),_:1})])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"defaultSiteId",label:e.$t("config.defaultSite")},{default:n((()=>[m(oe,{modelValue:X.value.defaultSiteId,"onUpdate:modelValue":a[55]||(a[55]=e=>X.value.defaultSiteId=e),data:ee.value,nodeKey:"id",props:{label:"name"},class:"w-full","render-after-expand":!1,"check-strictly":""},null,8,["modelValue","data"])])),_:1},8,["label"])])),_:1}),m(k,{span:12},{default:n((()=>[m(q,{prop:"multiDomain"},{label:n((()=>[m(z,{message:"config.multiDomain",help:""})])),default:n((()=>[m(Q,{modelValue:X.value.multiDomain,"onUpdate:modelValue":a[56]||(a[56]=e=>X.value.multiDomain=e)},null,8,["modelValue"])])),_:1})])),_:1})])),_:1})),"security"!==se.value||v(E).epRank>1?f((r(),i("div",J,[m(re,{disabled:v(F)(`config:${se.value}:update`),onClick:a[57]||(a[57]=b((e=>{P.value.validate((async e=>{if(e){Z.value=!0;try{"upload"===se.value?await I(X.value):"security"===se.value?await K(X.value):"customs"===se.value?await D(X.value):"sms"===se.value?await A(X.value):"uploadStorage"===se.value?await R(X.value):"htmlStorage"===se.value?await C(X.value):"templateStorage"===se.value?await j(X.value):await H(X.value),O(),x.success(l("success"))}finally{Z.value=!1}pe()}}))}),["prevent"])),type:"primary","native-type":"submit"},{default:n((()=>[_(h(e.$t("save")),1)])),_:1},8,["disabled"]),"sms"===se.value&&0!==X.value.provider?(r(),p(re,{key:0,disabled:v(F)("config:sms:update")||!(null!==(u=X.value.testMobile)&&void 0!==u&&u.trim()),onClick:a[58]||(a[58]=e=>{P.value.validate((async e=>{if(e){Z.value=!0;try{const{status:e,message:a}=await N(X.value);-1===e?w.alert(a):x.success(l("success"))}finally{Z.value=!1}pe()}}))})},{default:n((()=>[_(h(e.$t("config.sms.op.testSend")),1)])),_:1},8,["disabled"])):y("",!0)])),[[ge,Z.value]]):y("",!0)]})),_:1},8,["model"])),[[ge,Y.value]])])),_:1})])),_:1})}}}),[["__scopeId","data-v-5a5c1dd5"]]))}}}))}();
