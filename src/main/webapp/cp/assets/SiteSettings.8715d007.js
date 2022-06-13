var pe=Object.defineProperty,ve=Object.defineProperties;var fe=Object.getOwnPropertyDescriptors;var N=Object.getOwnPropertySymbols;var _e=Object.prototype.hasOwnProperty,ge=Object.prototype.propertyIsEnumerable;var K=(m,p,v)=>p in m?pe(m,p,{enumerable:!0,configurable:!0,writable:!0,value:v}):m[p]=v,E=(m,p)=>{for(var v in p||(p={}))_e.call(p,v)&&K(m,v,p[v]);if(N)for(var v of N(p))ge.call(p,v)&&K(m,v,p[v]);return m},F=(m,p)=>ve(m,fe(p));import{g as be,u as Ve,I as f,i as H,M as ye,j as n,N as we,o as d,k as _,w as a,l as e,q as V,C as y,F as w,O as ce,m as h,y as C,P as O,A as j,K as ke,Q as qe,ah as $e,ai as Se}from"./vendor.3651bf9f.js";import{t as he}from"./tree.4a0f1dfa.js";import{t as Ue,q as Ie,w as Te,x as De,y as Le,z as Ce}from"./config.d674241a.js";import{q as Me}from"./user.7976785a.js";import{_ as Be,o as L,p as Pe}from"./index.53bc5a6e.js";import{_ as i}from"./LabelTip.06c71e40.js";import{a as A}from"./ImageListUpload.vue_vue_type_style_index_0_scoped_true_lang.ebc555fa.js";import{_ as We}from"./FieldItem.c5e3c5bd.js";import"./content.773ecdb4.js";const ze=m=>($e("data-v-640cf7c8"),m=m(),Se(),m),Ne={class:"watermark-position"},Ke=ze(()=>C("span",null,null,-1)),Ee={name:"SiteSettings"},Fe=be(F(E({},Ee),{emits:{"update:modelValue":null,finished:null},setup(m){const{t:p}=Ve(),v=f(),c=f(),t=f({}),k=f(!1),U=f(!1),J=f([]),I=f([]),T=f([]),M=f(),Q=H(()=>T.value.find(u=>u.id===M.value)),G=H(()=>{var u;return JSON.parse(((u=Q.value)==null?void 0:u.customs)||"[]")}),q=[];L("siteSettings:base:update")&&q.push("base"),L("siteSettings:watermark:update")&&q.push("watermark"),L("siteSettings:customs:update")&&q.push("customs");const g=f(q[0]),B=u=>{u==="watermark"?t.value=c.value.watermark:u==="customs"?t.value=c.value.customs:t.value=c.value},R=async()=>{I.value=await Ue()},X=async()=>{J.value=he(await Me())},Y=async()=>{T.value=await Ie({type:"site"})},P=async()=>{c.value=await Te(),M.value=c.value.modelId,B(g.value)};ye(async()=>{k.value=!0;try{await Promise.all([R(),X(),Y(),P()])}finally{k.value=!1}});const Z=async()=>{k.value=!0;try{await P()}finally{k.value=!1}},x=()=>{v.value.validate(async u=>{if(!!u){U.value=!0;try{g.value==="watermark"?await De(t.value):g.value==="customs"?await Le(t.value):await Ce(t.value),qe.success(p("success"))}finally{U.value=!1}Z()}})};return(u,s)=>{const ee=n("el-tab-pane"),le=n("el-tabs"),ae=n("el-aside"),te=n("el-switch"),o=n("el-form-item"),r=n("el-col"),W=n("el-radio"),z=n("el-radio-group"),se=n("el-slider"),b=n("el-input"),D=n("el-row"),$=n("el-option"),S=n("el-select"),ue=n("el-input-number"),oe=n("el-button"),re=n("el-form"),ne=n("el-main"),de=n("el-container"),ie=we("loading");return d(),_(de,null,{default:a(()=>[e(ae,{width:"180px",class:"pr-3"},{default:a(()=>[e(le,{modelValue:g.value,"onUpdate:modelValue":s[0]||(s[0]=l=>g.value=l),onTabClick:s[1]||(s[1]=({paneName:l})=>B(l)),"tab-position":"left",stretch:"",class:"bg-white"},{default:a(()=>[(d(),V(w,null,y(q,l=>e(ee,{key:l,name:l,label:u.$t(`site.settings.${l}`)},null,8,["name","label"])),64))]),_:1},8,["modelValue"])]),_:1}),e(ne,{class:"p-3 app-block"},{default:a(()=>[ce((d(),_(re,{ref_key:"form",ref:v,model:t.value,"label-width":"150px"},{default:a(()=>[g.value==="watermark"?(d(),_(D,{key:0},{default:a(()=>[e(r,{span:24},{default:a(()=>[e(o,{prop:"enabled",rules:{required:!0,message:()=>u.$t("v.required")}},{label:a(()=>[e(i,{message:"site.watermark.enabled",help:""})]),default:a(()=>[e(te,{modelValue:t.value.enabled,"onUpdate:modelValue":s[2]||(s[2]=l=>t.value.enabled=l)},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(r,{span:12},{default:a(()=>[e(o,{prop:"overlay",label:u.$t("site.watermark.overlay"),rules:t.value.enabled?{required:!0,message:()=>u.$t("v.required")}:{}},{default:a(()=>[e(h(A),{modelValue:t.value.overlay,"onUpdate:modelValue":s[3]||(s[3]=l=>t.value.overlay=l)},null,8,["modelValue"])]),_:1},8,["label","rules"])]),_:1}),e(r,{span:12},{default:a(()=>[e(o,{prop:"position",label:u.$t("site.watermark.position"),rules:{required:!0,message:()=>u.$t("v.required")}},{default:a(()=>[e(z,{modelValue:t.value.position,"onUpdate:modelValue":s[4]||(s[4]=l=>t.value.position=l)},{default:a(()=>[C("div",Ne,[(d(),V(w,null,y(9,l=>e(W,{key:l,label:l,title:u.$t(`site.watermark.position.${l}`)},{default:a(()=>[Ke]),_:2},1032,["label","title"])),64))])]),_:1},8,["modelValue"])]),_:1},8,["label","rules"])]),_:1}),e(r,{span:24},{default:a(()=>[e(o,{prop:"dissolve",label:u.$t("site.watermark.dissolve"),rules:{required:!0,message:()=>u.$t("v.required")}},{label:a(()=>[e(i,{message:"site.watermark.dissolve",help:""})]),default:a(()=>[e(se,{modelValue:t.value.dissolve,"onUpdate:modelValue":s[5]||(s[5]=l=>t.value.dissolve=l),min:0,max:100,"show-input":""},null,8,["modelValue"])]),_:1},8,["label","rules"])]),_:1}),e(r,{span:12},{default:a(()=>[e(o,{prop:"minWidth",rules:{required:!0,message:()=>u.$t("v.required")}},{label:a(()=>[e(i,{message:"site.watermark.minWidth",help:""})]),default:a(()=>[e(b,{modelValue:t.value.minWidth,"onUpdate:modelValue":s[6]||(s[6]=l=>t.value.minWidth=l),modelModifiers:{number:!0},min:1,max:65535},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(r,{span:12},{default:a(()=>[e(o,{prop:"minHeight",rules:{required:!0,message:()=>u.$t("v.required")}},{label:a(()=>[e(i,{message:"site.watermark.minHeight",help:""})]),default:a(()=>[e(b,{modelValue:t.value.minHeight,"onUpdate:modelValue":s[7]||(s[7]=l=>t.value.minHeight=l),modelModifiers:{number:!0},min:1,max:65535},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1})]),_:1})):g.value==="customs"?(d(),_(D,{key:1},{default:a(()=>[(d(!0),V(w,null,y(h(G),l=>(d(),_(r,{key:l.code,span:l.double?12:24},{default:a(()=>[e(o,{prop:l.code,label:l.name,rules:l.required?{required:!0,message:()=>u.$t("v.required")}:void 0},{default:a(()=>[e(We,{field:l,modelValue:t.value[l.code],"onUpdate:modelValue":me=>t.value[l.code]=me},null,8,["field","modelValue","onUpdate:modelValue"])]),_:2},1032,["prop","label","rules"])]),_:2},1032,["span"]))),128))]),_:1})):(d(),_(D,{key:2},{default:a(()=>[e(r,{span:12},{default:a(()=>[e(o,{prop:"name",label:u.$t("site.name"),rules:{required:!0,message:()=>u.$t("v.required")}},{default:a(()=>[e(b,{modelValue:t.value.name,"onUpdate:modelValue":s[8]||(s[8]=l=>t.value.name=l),ref:"focus",maxlength:"50"},null,8,["modelValue"])]),_:1},8,["label","rules"])]),_:1}),e(r,{span:12},{default:a(()=>[e(o,{prop:"protocol",rules:{required:!0,message:()=>u.$t("v.required")}},{label:a(()=>[e(i,{message:"site.protocol",help:""})]),default:a(()=>[e(S,{modelValue:t.value.protocol,"onUpdate:modelValue":s[9]||(s[9]=l=>t.value.protocol=l),class:"w-full"},{default:a(()=>[(d(),V(w,null,y(["http","https"],l=>e($,{key:l,label:l,value:l},null,8,["label","value"])),64))]),_:1},8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(r,{span:12},{default:a(()=>[e(o,{prop:"domain",rules:[{required:!0,message:()=>u.$t("v.required")},{pattern:/^[a-z0-9-.]*$/,message:()=>u.$t("site.error.domainPattern")},{pattern:/^(?!(uploads|templates|WEB-INF|cp)$).*/i,message:()=>u.$t("site.error.excludesPattern")}]},{label:a(()=>[e(i,{message:"site.domain",help:""})]),default:a(()=>[e(b,{modelValue:t.value.domain,"onUpdate:modelValue":s[10]||(s[10]=l=>t.value.domain=l),maxlength:"50"},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(r,{span:12},{default:a(()=>[e(o,{prop:"subDir",rules:[{pattern:/^[\w-]*$/,message:()=>u.$t("site.error.subDirPattern")},{pattern:/^(?!(uploads|templates|WEB-INF|cp)$).*/i,message:()=>u.$t("site.error.excludesPattern")}]},{label:a(()=>[e(i,{message:"site.subDir",help:""})]),default:a(()=>[e(b,{modelValue:t.value.subDir,"onUpdate:modelValue":s[11]||(s[11]=l=>t.value.subDir=l),maxlength:"50"},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(r,{span:12},{default:a(()=>[e(o,{prop:"theme",rules:{required:!0,message:()=>u.$t("v.required")}},{label:a(()=>[e(i,{message:"site.theme",help:""})]),default:a(()=>[e(S,{modelValue:t.value.theme,"onUpdate:modelValue":s[12]||(s[12]=l=>t.value.theme=l),class:"w-full"},{default:a(()=>[(d(!0),V(w,null,y(I.value,l=>(d(),_($,{key:l,label:l,value:l},null,8,["label","value"]))),128))]),_:1},8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(r,{span:12},{default:a(()=>[e(o,{prop:"mobileTheme",rules:{required:!0,message:()=>u.$t("v.required")}},{label:a(()=>[e(i,{message:"site.mobileTheme",help:""})]),default:a(()=>[e(S,{modelValue:t.value.mobileTheme,"onUpdate:modelValue":s[13]||(s[13]=l=>t.value.mobileTheme=l),class:"w-full"},{default:a(()=>[(d(!0),V(w,null,y(I.value,l=>(d(),_($,{key:l,label:l,value:l},null,8,["label","value"]))),128))]),_:1},8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(r,{span:12},{default:a(()=>[e(o,{prop:"modelId",rules:{required:!0,message:()=>u.$t("v.required")}},{label:a(()=>[e(i,{message:"site.model",help:""})]),default:a(()=>[e(S,{modelValue:t.value.modelId,"onUpdate:modelValue":s[14]||(s[14]=l=>t.value.modelId=l),class:"w-full"},{default:a(()=>[(d(!0),V(w,null,y(T.value,l=>(d(),_($,{key:l.id,label:l.name,value:l.id},null,8,["label","value"]))),128))]),_:1},8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(r,{span:24},{default:a(()=>[e(o,{prop:"logo"},{label:a(()=>[e(i,{message:"site.logo",help:""})]),default:a(()=>[e(h(A),{modelValue:t.value.logo,"onUpdate:modelValue":s[15]||(s[15]=l=>t.value.logo=l)},null,8,["modelValue"])]),_:1})]),_:1}),e(r,{span:12},{default:a(()=>[e(o,{prop:"seoTitle"},{label:a(()=>[e(i,{message:"site.seoTitle",help:""})]),default:a(()=>[e(b,{modelValue:t.value.seoTitle,"onUpdate:modelValue":s[16]||(s[16]=l=>t.value.seoTitle=l),maxlength:"150"},null,8,["modelValue"])]),_:1})]),_:1}),e(r,{span:12},{default:a(()=>[e(o,{prop:"seoKeywords"},{label:a(()=>[e(i,{message:"site.seoKeywords",help:""})]),default:a(()=>[e(b,{modelValue:t.value.seoKeywords,"onUpdate:modelValue":s[17]||(s[17]=l=>t.value.seoKeywords=l),maxlength:"150"},null,8,["modelValue"])]),_:1})]),_:1}),e(r,{span:24},{default:a(()=>[e(o,{prop:"seoDescription"},{label:a(()=>[e(i,{message:"site.seoDescription",help:""})]),default:a(()=>[e(b,{modelValue:t.value.seoDescription,"onUpdate:modelValue":s[18]||(s[18]=l=>t.value.seoDescription=l),type:"textarea",rows:3,maxlength:"1000"},null,8,["modelValue"])]),_:1})]),_:1}),e(r,{span:12},{default:a(()=>[e(o,{prop:"pageSize",rules:{required:!0,message:()=>u.$t("v.required")}},{label:a(()=>[e(i,{message:"site.pageSize",help:""})]),default:a(()=>[e(ue,{modelValue:t.value.pageSize,"onUpdate:modelValue":s[19]||(s[19]=l=>t.value.pageSize=l),min:1,max:200},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1}),e(r,{span:12},{default:a(()=>[e(o,{prop:"status"},{label:a(()=>[e(i,{message:"site.status",help:""})]),default:a(()=>[e(z,{modelValue:t.value.status,"onUpdate:modelValue":s[20]||(s[20]=l=>t.value.status=l)},{default:a(()=>[(d(),V(w,null,y([0,1],l=>e(W,{key:l,label:l},{default:a(()=>[O(j(u.$t(`site.status.${l}`)),1)]),_:2},1032,["label"])),64))]),_:1},8,["modelValue"])]),_:1})]),_:1})]),_:1})),C("div",null,[e(oe,{disabled:h(Pe)(`siteSettings:${g.value}:update`),loading:U.value,onClick:ke(x,["prevent"]),type:"primary","native-type":"submit"},{default:a(()=>[O(j(u.$t("submit")),1)]),_:1},8,["disabled","loading","onClick"])])]),_:1},8,["model"])),[[ie,k.value]])]),_:1})]),_:1})}}}));var Ze=Be(Fe,[["__scopeId","data-v-640cf7c8"]]);export{Ze as default};
