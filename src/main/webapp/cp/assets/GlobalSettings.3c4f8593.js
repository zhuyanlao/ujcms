var ve=Object.defineProperty,Ve=Object.defineProperties;var ye=Object.getOwnPropertyDescriptors;var z=Object.getOwnPropertySymbols;var be=Object.prototype.hasOwnProperty,we=Object.prototype.propertyIsEnumerable;var J=(U,V,y)=>V in U?ve(U,V,{enumerable:!0,configurable:!0,writable:!0,value:y}):U[V]=y,Q=(U,V)=>{for(var y in V||(V={}))be.call(V,y)&&J(U,y,V[y]);if(z)for(var y of z(V))we.call(V,y)&&J(U,y,V[y]);return U},X=(U,V)=>Ve(U,ye(V));import{g as qe,u as Ue,I as k,i as _e,M as $e,j as g,N as ke,o as p,k as b,w as l,l as e,q as w,C,F as q,O as Y,m as f,y as xe,x as M,P as h,A as I,K as Me,Q as Z,e as Se}from"./vendor.7e46e91a.js";import{t as ce}from"./tree.4a0f1dfa.js";import{h as Le}from"./system.e5c0de2d.js";import{h as Te,j as Ce,k as he,l as Ie,m as De,n as Ke,o as Ae,p as Re,r as He,s as Pe,t as Ee,w as Ne,x as We,y as Be,z as Fe}from"./config.9f97987e.js";import{_ as Ge,D as x,h as v,m as ee,E as je}from"./index.e522d6d8.js";import{_ as r}from"./LabelTip.bc63985c.js";import{_ as Oe}from"./FieldItem.4edf26eb.js";import"./content.fbe0cd3c.js";import"./BaseUpload.vue_vue_type_style_index_0_scoped_true_lang.cc68b363.js";const ze=["innerHTML"],Je={key:7},Qe={name:"GlobalSettings"},Xe=qe(X(Q({},Qe),{setup(U){const{t:V}=Ue(),y=k(),c=k({}),a=k({}),L=k(!1),T=k(!1),R=k([]),H=k(),le=_e(()=>{var t;return JSON.parse(((t=H.value)==null?void 0:t.customs)||"[]")}),_=[];x("config:base:update")&&_.push("base"),x("config:upload:update")&&_.push("upload"),x("config:security:update")&&(v.epRank>=1||v.epDisplay)&&_.push("security"),x("config:sms:update")&&_.push("sms"),x("config:uploadStorage:update")&&_.push("uploadStorage"),x("config:htmlStorage:update")&&_.push("htmlStorage"),x("config:templateStorage:update")&&_.push("templateStorage"),x("config:customs:update")&&_.push("customs");const i=k(_[0]),P=async t=>{t==="upload"?a.value=c.value.upload:t==="security"?a.value=c.value.security:t==="customs"?a.value=c.value.customs:t==="sms"?a.value=await he():t==="uploadStorage"?a.value=await Ie():t==="htmlStorage"?a.value=await De():t==="templateStorage"?a.value=await Ke():a.value=c.value},ae=async()=>{H.value=await Te()},E=async()=>{c.value=await Ce(),P(i.value)},ue=async()=>{R.value=ce(await Le())};$e(async()=>{L.value=!0;try{await Promise.all([E(),ae(),ue()])}finally{L.value=!1}});const N=async()=>{L.value=!0;try{await E()}finally{L.value=!1}},se=()=>{y.value.validate(async t=>{if(!!t){T.value=!0;try{i.value==="upload"?await Ae(a.value):i.value==="security"?await Re(a.value):i.value==="customs"?await He(a.value):i.value==="sms"?await Pe(a.value):i.value==="uploadStorage"?await Ee(a.value):i.value==="htmlStorage"?await Ne(a.value):i.value==="templateStorage"?await We(a.value):await Be(a.value),je(),Z.success(V("success"))}finally{T.value=!1}N()}})},te=()=>{y.value.validate(async t=>{if(!!t){T.value=!0;try{const{status:s,message:D}=await Fe(a.value);s===-1?Se.alert(D):Z.success(V("success"))}finally{T.value=!1}N()}})};return(t,s)=>{const D=g("el-tab-pane"),oe=g("el-tabs"),de=g("el-aside"),n=g("el-input"),o=g("el-form-item"),d=g("el-col"),m=g("el-input-number"),S=g("el-row"),re=g("el-alert"),W=g("el-option"),B=g("el-select"),K=g("el-divider"),F=g("el-switch"),ne=g("el-radio-button"),pe=g("el-radio-group"),ie=g("el-tree-select"),G=g("el-button"),me=g("el-form"),ge=g("el-main"),fe=g("el-container"),j=ke("loading");return p(),b(fe,null,{default:l(()=>[e(de,{width:"180px",class:"pr-3"},{default:l(()=>[e(oe,{modelValue:i.value,"onUpdate:modelValue":s[0]||(s[0]=$=>i.value=$),onTabClick:s[1]||(s[1]=({paneName:$})=>P($)),"tab-position":"left",stretch:"",class:"bg-white"},{default:l(()=>[(p(),w(q,null,C(_,$=>e(D,{key:$,name:$,label:t.$t(`config.settings.${$}`)},null,8,["name","label"])),64))]),_:1},8,["modelValue"])]),_:1}),e(ge,{class:"p-3 app-block"},{default:l(()=>[Y((p(),b(me,{ref_key:"form",ref:y,model:a.value,"label-width":"160px"},{default:l(()=>{var $;return[i.value==="upload"?(p(),b(S,{key:0},{default:l(()=>[e(d,{span:12},{default:l(()=>[e(o,{prop:"imageTypes",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.upload.imageTypes",help:""})]),default:l(()=>[e(n,{modelValue:a.value.imageTypes,"onUpdate:modelValue":s[2]||(s[2]=u=>a.value.imageTypes=u),maxlength:"255"},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"imageLimit",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.upload.imageLimit",help:""})]),default:l(()=>[e(m,{modelValue:a.value.imageLimit,"onUpdate:modelValue":s[3]||(s[3]=u=>a.value.imageLimit=u),min:0,max:65535},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"videoTypes",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.upload.videoTypes",help:""})]),default:l(()=>[e(n,{modelValue:a.value.videoTypes,"onUpdate:modelValue":s[4]||(s[4]=u=>a.value.videoTypes=u),maxlength:"255"},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"videoLimit",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.upload.videoLimit",help:""})]),default:l(()=>[e(m,{modelValue:a.value.videoLimit,"onUpdate:modelValue":s[5]||(s[5]=u=>a.value.videoLimit=u),min:0,max:65535},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"audioTypes",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.upload.audioTypes",help:""})]),default:l(()=>[e(n,{modelValue:a.value.audioTypes,"onUpdate:modelValue":s[6]||(s[6]=u=>a.value.audioTypes=u),maxlength:"255"},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"audioLimit",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.upload.audioLimit",help:""})]),default:l(()=>[e(m,{modelValue:a.value.audioLimit,"onUpdate:modelValue":s[7]||(s[7]=u=>a.value.audioLimit=u),min:0,max:65535},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"libraryTypes",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.upload.libraryTypes",help:""})]),default:l(()=>[e(n,{modelValue:a.value.libraryTypes,"onUpdate:modelValue":s[8]||(s[8]=u=>a.value.libraryTypes=u),maxlength:"255"},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"libraryLimit",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.upload.libraryLimit",help:""})]),default:l(()=>[e(m,{modelValue:a.value.libraryLimit,"onUpdate:modelValue":s[9]||(s[9]=u=>a.value.libraryLimit=u),min:0,max:65535},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"docTypes",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.upload.docTypes",help:""})]),default:l(()=>[e(n,{modelValue:a.value.docTypes,"onUpdate:modelValue":s[10]||(s[10]=u=>a.value.docTypes=u),maxlength:"255"},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"docLimit",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.upload.docLimit",help:""})]),default:l(()=>[e(m,{modelValue:a.value.docLimit,"onUpdate:modelValue":s[11]||(s[11]=u=>a.value.docLimit=u),min:0,max:65535},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"fileTypes",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.upload.fileTypes",help:""})]),default:l(()=>[e(n,{modelValue:a.value.fileTypes,"onUpdate:modelValue":s[12]||(s[12]=u=>a.value.fileTypes=u),maxlength:"255"},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"fileLimit",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.upload.fileLimit",help:""})]),default:l(()=>[e(m,{modelValue:a.value.fileLimit,"onUpdate:modelValue":s[13]||(s[13]=u=>a.value.fileLimit=u),min:0,max:65535},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"imageMaxWidth",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.upload.imageMaxWidth",help:""})]),default:l(()=>[e(m,{modelValue:a.value.imageMaxWidth,"onUpdate:modelValue":s[14]||(s[14]=u=>a.value.imageMaxWidth=u),min:0,max:65535},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"imageMaxHeight",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.upload.imageMaxHeight",help:""})]),default:l(()=>[e(m,{modelValue:a.value.imageMaxHeight,"onUpdate:modelValue":s[15]||(s[15]=u=>a.value.imageMaxHeight=u),min:0,max:65535},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1})]),_:1})):i.value==="security"&&f(v).epRank<1?(p(),b(re,{key:1,type:"warning",closable:!1,"show-icon":!0},{title:l(()=>[xe("span",{innerHTML:t.$t("error.enterprise")},null,8,ze)]),_:1})):i.value==="security"&&f(v).epRank>=1?(p(),b(S,{key:2},{default:l(()=>[e(d,{span:24},{default:l(()=>[e(o,{prop:"passwordStrength"},{label:l(()=>[e(r,{message:"config.security.passwordStrength"})]),default:l(()=>[e(B,{modelValue:a.value.passwordStrength,"onUpdate:modelValue":s[16]||(s[16]=u=>a.value.passwordStrength=u),class:"w-full"},{default:l(()=>[(p(),w(q,null,C([0,1,2,3,4],u=>e(W,{key:u,value:u,label:t.$t(`config.security.passwordStrength.${u}`)},null,8,["value","label"])),64))]),_:1},8,["modelValue"])]),_:1})]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"passwordMinLength"},{label:l(()=>[e(r,{message:"config.security.passwordMinLength",help:""})]),default:l(()=>[e(m,{modelValue:a.value.passwordMinLength,"onUpdate:modelValue":s[17]||(s[17]=u=>a.value.passwordMinLength=u),min:0,max:16},null,8,["modelValue"])]),_:1})]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"passwordMaxLength"},{label:l(()=>[e(r,{message:"config.security.passwordMaxLength",help:""})]),default:l(()=>[e(m,{modelValue:a.value.passwordMaxLength,"onUpdate:modelValue":s[18]||(s[18]=u=>a.value.passwordMaxLength=u),min:16,max:128},null,8,["modelValue"])]),_:1})]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"userMaxAttempts"},{label:l(()=>[e(r,{message:"config.security.userMaxAttempts",help:""})]),default:l(()=>[e(m,{modelValue:a.value.userMaxAttempts,"onUpdate:modelValue":s[19]||(s[19]=u=>a.value.userMaxAttempts=u),min:0,max:100},null,8,["modelValue"])]),_:1})]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"userLockMinutes"},{label:l(()=>[e(r,{message:"config.security.userLockMinutes",help:""})]),default:l(()=>[e(m,{modelValue:a.value.userLockMinutes,"onUpdate:modelValue":s[20]||(s[20]=u=>a.value.userLockMinutes=u),min:1,max:1440},null,8,["modelValue"])]),_:1})]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"ipCaptchaAttempts"},{label:l(()=>[e(r,{message:"config.security.ipCaptchaAttempts",help:""})]),default:l(()=>[e(m,{modelValue:a.value.ipCaptchaAttempts,"onUpdate:modelValue":s[21]||(s[21]=u=>a.value.ipCaptchaAttempts=u),min:0,max:100},null,8,["modelValue"])]),_:1})]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"ipMaxAttempts"},{label:l(()=>[e(r,{message:"config.security.ipMaxAttempts",help:""})]),default:l(()=>[e(m,{modelValue:a.value.ipMaxAttempts,"onUpdate:modelValue":s[22]||(s[22]=u=>a.value.ipMaxAttempts=u),min:0,max:999},null,8,["modelValue"])]),_:1})]),_:1}),f(v).epRank>=2||f(v).epDisplay?(p(),w(q,{key:0},[e(K,{"content-position":"left"}),e(d,{span:12},{default:l(()=>[e(o,{prop:"passwordMinDays"},{label:l(()=>[e(r,{message:"config.security.passwordMinDays",help:""})]),default:l(()=>[e(m,{modelValue:a.value.passwordMinDays,"onUpdate:modelValue":s[23]||(s[23]=u=>a.value.passwordMinDays=u),min:0,max:998},null,8,["modelValue"])]),_:1})]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"passwordMaxDays"},{label:l(()=>[e(r,{message:"config.security.passwordMaxDays",help:""})]),default:l(()=>[e(m,{modelValue:a.value.passwordMaxDays,"onUpdate:modelValue":s[24]||(s[24]=u=>a.value.passwordMaxDays=u),min:0,max:999},null,8,["modelValue"])]),_:1})]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"passwordWarnDays"},{label:l(()=>[e(r,{message:"config.security.passwordWarnDays",help:""})]),default:l(()=>[e(m,{modelValue:a.value.passwordWarnDays,"onUpdate:modelValue":s[25]||(s[25]=u=>a.value.passwordWarnDays=u),min:0,max:90},null,8,["modelValue"])]),_:1})]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"passwordMaxHistory"},{label:l(()=>[e(r,{message:"config.security.passwordMaxHistory",help:""})]),default:l(()=>[e(m,{modelValue:a.value.passwordMaxHistory,"onUpdate:modelValue":s[26]||(s[26]=u=>a.value.passwordMaxHistory=u),min:0,max:24},null,8,["modelValue"])]),_:1})]),_:1})],64)):M("",!0),f(v).epRank>=3||f(v).epDisplay?(p(),w(q,{key:1},[e(K,{"content-position":"left"}),e(d,{span:12},{default:l(()=>[e(o,{prop:"twoFactor"},{label:l(()=>[e(r,{message:"config.security.twoFactor",help:""})]),default:l(()=>[e(F,{modelValue:a.value.twoFactor,"onUpdate:modelValue":s[27]||(s[27]=u=>a.value.twoFactor=u),disabled:f(v).epRank<3},null,8,["modelValue","disabled"])]),_:1})]),_:1})],64)):M("",!0)]),_:1})):i.value==="sms"?(p(),b(S,{key:3},{default:l(()=>[e(d,{span:12},{default:l(()=>[e(o,{prop:"provider",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.sms.provider"})]),default:l(()=>[e(pe,{modelValue:a.value.provider,"onUpdate:modelValue":s[28]||(s[28]=u=>a.value.provider=u)},{default:l(()=>[(p(),w(q,null,C([0,1,2],u=>e(ne,{key:u,label:u},{default:l(()=>[h(I(t.$t(`config.sms.provider.${u}`)),1)]),_:2},1032,["label"])),64))]),_:1},8,["modelValue"])]),_:1},8,["rules"])]),_:1}),a.value.provider!==0?(p(),w(q,{key:0},[e(d,{span:12},{default:l(()=>[e(o,{prop:"maxPerIp"},{label:l(()=>[e(r,{message:"config.sms.maxPerIp"})]),default:l(()=>[e(m,{modelValue:a.value.maxPerIp,"onUpdate:modelValue":s[29]||(s[29]=u=>a.value.maxPerIp=u),min:1,max:99999},null,8,["modelValue"])]),_:1})]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"codeLength"},{label:l(()=>[e(r,{message:"config.sms.codeLength"})]),default:l(()=>[e(m,{modelValue:a.value.codeLength,"onUpdate:modelValue":s[30]||(s[30]=u=>a.value.codeLength=u),min:4,max:6},null,8,["modelValue"])]),_:1})]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"codeExpires"},{label:l(()=>[e(r,{message:"config.sms.codeExpires",help:""})]),default:l(()=>[e(m,{modelValue:a.value.codeExpires,"onUpdate:modelValue":s[31]||(s[31]=u=>a.value.codeExpires=u),min:3,max:30},null,8,["modelValue"])]),_:1})]),_:1}),a.value.provider===1?(p(),w(q,{key:0},[e(d,{span:12},{default:l(()=>[e(o,{prop:"accessKeyId",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.sms.accessKeyId"})]),default:l(()=>[e(n,{modelValue:a.value.accessKeyId,"onUpdate:modelValue":s[32]||(s[32]=u=>a.value.accessKeyId=u),maxlength:"128","show-password":""},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"accessKeySecret",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.sms.accessKeySecret"})]),default:l(()=>[e(n,{modelValue:a.value.accessKeySecret,"onUpdate:modelValue":s[33]||(s[33]=u=>a.value.accessKeySecret=u),maxlength:"128","show-password":""},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"templateCode",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.sms.templateCode"})]),default:l(()=>[e(n,{modelValue:a.value.templateCode,"onUpdate:modelValue":s[34]||(s[34]=u=>a.value.templateCode=u),maxlength:"32"},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"codeName",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.sms.codeName"})]),default:l(()=>[e(n,{modelValue:a.value.codeName,"onUpdate:modelValue":s[35]||(s[35]=u=>a.value.codeName=u),maxlength:"20"},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1})],64)):a.value.provider===2?(p(),w(q,{key:1},[e(d,{span:12},{default:l(()=>[e(o,{prop:"secretId",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.sms.secretId"})]),default:l(()=>[e(n,{modelValue:a.value.secretId,"onUpdate:modelValue":s[36]||(s[36]=u=>a.value.secretId=u),maxlength:"128","show-password":""},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"secretKey",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.sms.secretKey"})]),default:l(()=>[e(n,{modelValue:a.value.secretKey,"onUpdate:modelValue":s[37]||(s[37]=u=>a.value.secretKey=u),maxlength:"128","show-password":""},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"templateId",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.sms.templateId"})]),default:l(()=>[e(n,{modelValue:a.value.templateId,"onUpdate:modelValue":s[38]||(s[38]=u=>a.value.templateId=u),maxlength:"32"},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"sdkAppId",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.sms.sdkAppId"})]),default:l(()=>[e(n,{modelValue:a.value.sdkAppId,"onUpdate:modelValue":s[39]||(s[39]=u=>a.value.sdkAppId=u),maxlength:"64"},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"region",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.sms.region",help:""})]),default:l(()=>[e(n,{modelValue:a.value.region,"onUpdate:modelValue":s[40]||(s[40]=u=>a.value.region=u),maxlength:"64"},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1})],64)):M("",!0),e(d,{span:12},{default:l(()=>[e(o,{prop:"signName",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.sms.signName",help:""})]),default:l(()=>[e(n,{modelValue:a.value.signName,"onUpdate:modelValue":s[41]||(s[41]=u=>a.value.signName=u),maxlength:"50"},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(K,{"content-position":"left"},{default:l(()=>[h(I(t.$t("config.sms.test")),1)]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"testMobile"},{label:l(()=>[e(r,{message:"config.sms.testMobile"})]),default:l(()=>[e(n,{modelValue:a.value.testMobile,"onUpdate:modelValue":s[42]||(s[42]=u=>a.value.testMobile=u),maxlength:"30"},null,8,["modelValue"])]),_:1})]),_:1})],64)):M("",!0)]),_:1})):i.value==="uploadStorage"||i.value==="htmlStorage"||i.value==="templateStorage"?(p(),b(S,{key:4},{default:l(()=>[e(d,{span:24},{default:l(()=>[e(o,{prop:"type",rules:[{required:!0,message:()=>t.$t("v.required")},{validator:(u,A,O)=>{A===1&&f(v).epRank<1&&O(t.$t("error.enterprise.short")),O()}}]},{label:l(()=>[e(r,{message:"config.storage.type"})]),default:l(()=>[e(B,{modelValue:a.value.type,"onUpdate:modelValue":s[43]||(s[43]=u=>a.value.type=u),class:"w-full"},{default:l(()=>[(p(!0),w(q,null,C([0,1].filter(u=>u!==1||f(v).epRank>0||f(v).epDisplay),u=>(p(),b(W,{key:u,value:u,label:t.$t(`config.storage.type.${u}`)},null,8,["value","label"]))),128))]),_:1},8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:24},{default:l(()=>[e(o,{prop:"path",rules:{pattern:/^(?!.*\.\.).*$/,message:()=>t.$t("v.url")}},{label:l(()=>[e(r,{message:"config.storage.path"})]),default:l(()=>[e(n,{modelValue:a.value.path,"onUpdate:modelValue":s[44]||(s[44]=u=>a.value.path=u),maxlength:"160"},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:24},{default:l(()=>[e(o,{prop:"url",rules:{pattern:/^(?!.*\.\.).*$/,message:()=>t.$t("v.url")}},{label:l(()=>[e(r,{message:"config.storage.url"})]),default:l(()=>[e(n,{modelValue:a.value.url,"onUpdate:modelValue":s[45]||(s[45]=u=>a.value.url=u),maxlength:"160"},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),a.value.type===1?(p(),w(q,{key:0},[e(d,{span:24},{default:l(()=>[e(o,{prop:"endpoint",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.storage.endpoint"})]),default:l(()=>[e(n,{modelValue:a.value.endpoint,"onUpdate:modelValue":s[46]||(s[46]=u=>a.value.endpoint=u),maxlength:"160",disabled:f(v).epRank<1},null,8,["modelValue","disabled"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"region",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.storage.region"})]),default:l(()=>[e(n,{modelValue:a.value.region,"onUpdate:modelValue":s[47]||(s[47]=u=>a.value.region=u),maxlength:"160",disabled:f(v).epRank<1},null,8,["modelValue","disabled"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"bucket",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.storage.bucket"})]),default:l(()=>[e(n,{modelValue:a.value.bucket,"onUpdate:modelValue":s[48]||(s[48]=u=>a.value.bucket=u),maxlength:"160",disabled:f(v).epRank<1},null,8,["modelValue","disabled"])]),_:1},8,["rules"])]),_:1}),e(d,{span:24},{default:l(()=>[e(o,{prop:"accessKey",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.storage.accessKey"})]),default:l(()=>[e(n,{modelValue:a.value.accessKey,"onUpdate:modelValue":s[49]||(s[49]=u=>a.value.accessKey=u),type:"password","show-password":"",maxlength:"160",disabled:f(v).epRank<1},null,8,["modelValue","disabled"])]),_:1},8,["rules"])]),_:1}),e(d,{span:24},{default:l(()=>[e(o,{prop:"secretKey",rules:{required:!0,message:()=>t.$t("v.required")}},{label:l(()=>[e(r,{message:"config.storage.secretKey"})]),default:l(()=>[e(n,{modelValue:a.value.secretKey,"onUpdate:modelValue":s[50]||(s[50]=u=>a.value.secretKey=u),type:"password","show-password":"",maxlength:"160",disabled:f(v).epRank<1},null,8,["modelValue","disabled"])]),_:1},8,["rules"])]),_:1})],64)):M("",!0)]),_:1})):i.value==="customs"?(p(),b(S,{key:5},{default:l(()=>[(p(!0),w(q,null,C(f(le),u=>(p(),b(d,{key:u.code,span:u.double?12:24},{default:l(()=>[e(o,{prop:u.code,rules:u.required?{required:!0,message:()=>t.$t("v.required")}:void 0},{label:l(()=>[e(r,{label:u.name},null,8,["label"])]),default:l(()=>[e(Oe,{field:u,modelValue:a.value[u.code],"onUpdate:modelValue":A=>a.value[u.code]=A},null,8,["field","modelValue","onUpdate:modelValue"])]),_:2},1032,["prop","rules"])]),_:2},1032,["span"]))),128))]),_:1})):(p(),b(S,{key:6},{default:l(()=>[e(d,{span:12},{default:l(()=>[e(o,{prop:"port",rules:{type:"number",min:0,max:65535,message:()=>t.$t("v.range",{min:0,max:65535})}},{label:l(()=>[e(r,{message:"config.port",help:""})]),default:l(()=>[e(n,{modelValue:a.value.port,"onUpdate:modelValue":s[51]||(s[51]=u=>a.value.port=u),modelModifiers:{number:!0}},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"contextPath"},{label:l(()=>[e(r,{message:"config.contextPath",help:""})]),default:l(()=>[e(n,{modelValue:a.value.contextPath,"onUpdate:modelValue":s[52]||(s[52]=u=>a.value.contextPath=u),maxlength:"50"},null,8,["modelValue"])]),_:1})]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"channelUrl",rules:{pattern:/^\/[\w-]+$/,message:()=>t.$t("config.error.channelUrlPattern")}},{label:l(()=>[e(r,{message:"config.channelUrl",help:""})]),default:l(()=>[e(n,{modelValue:a.value.channelUrl,"onUpdate:modelValue":s[53]||(s[53]=u=>a.value.channelUrl=u),maxlength:"50"},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"articleUrl"},{label:l(()=>[e(r,{message:"config.articleUrl",help:""})]),default:l(()=>[e(n,{modelValue:a.value.articleUrl,"onUpdate:modelValue":s[54]||(s[54]=u=>a.value.articleUrl=u),maxlength:"50"},null,8,["modelValue"])]),_:1})]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"defaultSiteId",label:t.$t("config.defaultSite")},{default:l(()=>[e(ie,{modelValue:a.value.defaultSiteId,"onUpdate:modelValue":s[55]||(s[55]=u=>a.value.defaultSiteId=u),data:R.value,nodeKey:"id",props:{label:"name"},class:"w-full","render-after-expand":!1,"check-strictly":""},null,8,["modelValue","data"])]),_:1},8,["label"])]),_:1}),e(d,{span:12},{default:l(()=>[e(o,{prop:"multiDomain"},{label:l(()=>[e(r,{message:"config.multiDomain",help:""})]),default:l(()=>[e(F,{modelValue:a.value.multiDomain,"onUpdate:modelValue":s[56]||(s[56]=u=>a.value.multiDomain=u)},null,8,["modelValue"])]),_:1})]),_:1})]),_:1})),i.value!=="security"||f(v).epRank>1?Y((p(),w("div",Je,[e(G,{disabled:f(ee)(`config:${i.value}:update`),onClick:s[57]||(s[57]=Me(u=>se(),["prevent"])),type:"primary","native-type":"submit"},{default:l(()=>[h(I(t.$t("save")),1)]),_:1},8,["disabled"]),i.value==="sms"&&a.value.provider!==0?(p(),b(G,{key:0,disabled:f(ee)("config:sms:update")||!(($=a.value.testMobile)==null?void 0:$.trim()),onClick:s[58]||(s[58]=u=>te())},{default:l(()=>[h(I(t.$t("config.sms.op.testSend")),1)]),_:1},8,["disabled"])):M("",!0)])),[[j,T.value]]):M("",!0)]}),_:1},8,["model"])),[[j,L.value]])]),_:1})]),_:1})}}}));var rl=Ge(Xe,[["__scopeId","data-v-5a5c1dd5"]]);export{rl as default};