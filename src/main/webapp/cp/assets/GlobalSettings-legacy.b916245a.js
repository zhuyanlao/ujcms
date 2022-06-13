!function(){var e=document.createElement("style");e.innerHTML=".el-tabs[data-v-38fbba38] .el-tabs__header{float:right;margin-right:1px}\n",document.head.appendChild(e),System.register(["./vendor-legacy.27f41ac3.js","./tree-legacy.a39fb697.js","./system-legacy.bf64b722.js","./config-legacy.2d1411fe.js","./index-legacy.d4f0198e.js","./LabelTip-legacy.3dbdffd3.js","./FieldItem-legacy.3527659e.js","./content-legacy.0664afc8.js","./ImageListUpload.vue_vue_type_style_index_0_scoped_true_lang-legacy.ed73c1af.js"],(function(e){"use strict";var l,a,u,t,o,d,s,i,r,n,m,p,g,f,c,v,y,V,_,h,b,x,q,U,$,w,S,L,T,k,j,M,K,I,P,C,D,H,W,N,F;return{setters:[function(e){l=e.g,a=e.u,u=e.I,t=e.i,o=e.M,d=e.j,s=e.N,i=e.o,r=e.k,n=e.w,m=e.l,p=e.q,g=e.C,f=e.F,c=e.O,v=e.m,y=e.x,V=e.y,_=e.P,h=e.A,b=e.K,x=e.Q},function(e){q=e.t},function(e){U=e.f},function(e){$=e.h,w=e.b,S=e.j,L=e.k,T=e.l,k=e.m,j=e.n,M=e.o,K=e.p,I=e.r,P=e.s},function(e){C=e._,D=e.o,H=e.c,W=e.p},function(e){N=e._},function(e){F=e._},function(){},function(){}],execute:function(){e("default",C(l({name:"GlobalSettings",setup(e){const{t:l}=a(),C=u(),O=u({}),R=u({}),A=u(!1),E=u(!1),G=u([]),J=u(),Q=t((()=>{var e;return JSON.parse((null===(e=J.value)||void 0===e?void 0:e.customs)||"[]")})),z=[];D("config:base:update")&&z.push("base"),D("config:upload:update")&&z.push("upload"),D("config:uploadStorage:update")&&z.push("uploadStorage"),D("config:htmlStorage:update")&&z.push("htmlStorage"),D("config:templateStorage:update")&&z.push("templateStorage"),D("config:customs:update")&&z.push("customs");const B=u(z[0]),X=async e=>{R.value="upload"===e?O.value.upload:"uploadStorage"===e?await S():"htmlStorage"===e?await L():"templateStorage"===e?await T():"customs"===e?O.value.customs:O.value},Y=async()=>{J.value=await $()},Z=async()=>{O.value=await w(),X(B.value)},ee=async()=>{G.value=q(await U())};o((async()=>{A.value=!0;try{await Promise.all([Z(),Y(),ee()])}finally{A.value=!1}}));const le=()=>{C.value.validate((async e=>{if(e){E.value=!0;try{"upload"===B.value?await k(R.value):"customs"===B.value?await j(R.value):"uploadStorage"===B.value?await M(R.value):"htmlStorage"===B.value?await K(R.value):"templateStorage"===B.value?await I(R.value):await P(R.value),x.success(l("success"))}finally{E.value=!1}(async()=>{A.value=!0;try{await Z()}finally{A.value=!1}})()}}))};return(e,l)=>{const a=d("el-tab-pane"),u=d("el-tabs"),t=d("el-aside"),o=d("el-input"),x=d("el-form-item"),q=d("el-col"),U=d("el-input-number"),$=d("el-row"),w=d("el-option"),S=d("el-select"),L=d("el-cascader"),T=d("el-switch"),k=d("el-button"),j=d("el-form"),M=d("el-main"),K=d("el-container"),I=s("loading");return i(),r(K,null,{default:n((()=>[m(t,{width:"180px",class:"pr-3"},{default:n((()=>[m(u,{modelValue:B.value,"onUpdate:modelValue":l[0]||(l[0]=e=>B.value=e),onTabClick:l[1]||(l[1]=({paneName:e})=>X(e)),"tab-position":"left",stretch:"",class:"bg-white"},{default:n((()=>[(i(),p(f,null,g(z,(l=>m(a,{key:l,name:l,label:e.$t(`config.settings.${l}`)},null,8,["name","label"]))),64))])),_:1},8,["modelValue"])])),_:1}),m(M,{class:"p-3 app-block"},{default:n((()=>[c((i(),r(j,{ref_key:"form",ref:C,model:R.value,"label-width":"150px"},{default:n((()=>["upload"===B.value?(i(),r($,{key:0},{default:n((()=>[m(q,{span:12},{default:n((()=>[m(x,{prop:"imageTypes",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(N,{message:"config.upload.imageTypes",help:""})])),default:n((()=>[m(o,{modelValue:R.value.imageTypes,"onUpdate:modelValue":l[2]||(l[2]=e=>R.value.imageTypes=e),maxlength:"255"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:12},{default:n((()=>[m(x,{prop:"imageLimit",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(N,{message:"config.upload.imageLimit",help:""})])),default:n((()=>[m(U,{modelValue:R.value.imageLimit,"onUpdate:modelValue":l[3]||(l[3]=e=>R.value.imageLimit=e),min:0,max:65535},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:12},{default:n((()=>[m(x,{prop:"videoTypes",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(N,{message:"config.upload.videoTypes",help:""})])),default:n((()=>[m(o,{modelValue:R.value.videoTypes,"onUpdate:modelValue":l[4]||(l[4]=e=>R.value.videoTypes=e),maxlength:"255"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:12},{default:n((()=>[m(x,{prop:"videoLimit",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(N,{message:"config.upload.videoLimit",help:""})])),default:n((()=>[m(U,{modelValue:R.value.videoLimit,"onUpdate:modelValue":l[5]||(l[5]=e=>R.value.videoLimit=e),min:0,max:65535},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:12},{default:n((()=>[m(x,{prop:"libraryTypes",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(N,{message:"config.upload.libraryTypes",help:""})])),default:n((()=>[m(o,{modelValue:R.value.libraryTypes,"onUpdate:modelValue":l[6]||(l[6]=e=>R.value.libraryTypes=e),maxlength:"255"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:12},{default:n((()=>[m(x,{prop:"libraryLimit",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(N,{message:"config.upload.libraryLimit",help:""})])),default:n((()=>[m(U,{modelValue:R.value.libraryLimit,"onUpdate:modelValue":l[7]||(l[7]=e=>R.value.libraryLimit=e),min:0,max:65535},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:12},{default:n((()=>[m(x,{prop:"docTypes",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(N,{message:"config.upload.docTypes",help:""})])),default:n((()=>[m(o,{modelValue:R.value.docTypes,"onUpdate:modelValue":l[8]||(l[8]=e=>R.value.docTypes=e),maxlength:"255"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:12},{default:n((()=>[m(x,{prop:"docLimit",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(N,{message:"config.upload.docLimit",help:""})])),default:n((()=>[m(U,{modelValue:R.value.docLimit,"onUpdate:modelValue":l[9]||(l[9]=e=>R.value.docLimit=e),min:0,max:65535},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:12},{default:n((()=>[m(x,{prop:"fileTypes",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(N,{message:"config.upload.fileTypes",help:""})])),default:n((()=>[m(o,{modelValue:R.value.fileTypes,"onUpdate:modelValue":l[10]||(l[10]=e=>R.value.fileTypes=e),maxlength:"255"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:12},{default:n((()=>[m(x,{prop:"fileLimit",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(N,{message:"config.upload.fileLimit",help:""})])),default:n((()=>[m(U,{modelValue:R.value.fileLimit,"onUpdate:modelValue":l[11]||(l[11]=e=>R.value.fileLimit=e),min:0,max:65535},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:12},{default:n((()=>[m(x,{prop:"imageMaxWidth",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(N,{message:"config.upload.imageMaxWidth",help:""})])),default:n((()=>[m(U,{modelValue:R.value.imageMaxWidth,"onUpdate:modelValue":l[12]||(l[12]=e=>R.value.imageMaxWidth=e),min:0,max:65535},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:12},{default:n((()=>[m(x,{prop:"imageMaxHeight",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(N,{message:"config.upload.imageMaxHeight",help:""})])),default:n((()=>[m(U,{modelValue:R.value.imageMaxHeight,"onUpdate:modelValue":l[13]||(l[13]=e=>R.value.imageMaxHeight=e),min:0,max:65535},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1})])),_:1})):"uploadStorage"===B.value||"htmlStorage"===B.value||"templateStorage"===B.value?(i(),r($,{key:1},{default:n((()=>[m(q,{span:24},{default:n((()=>[m(x,{prop:"type",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(N,{message:"config.storage.type"})])),default:n((()=>[m(S,{modelValue:R.value.type,"onUpdate:modelValue":l[14]||(l[14]=e=>R.value.type=e),class:"w-full"},{default:n((()=>[(i(!0),p(f,null,g([0,1].filter((e=>1!==e||v(H).epRank>0||v(H).epDisplay)),(l=>(i(),r(w,{disabled:v(H).epRank<=0&&v(H).epDisplay,key:l,value:l,label:e.$t(`config.storage.type.${l}`)},null,8,["disabled","value","label"])))),128))])),_:1},8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:24},{default:n((()=>[m(x,{prop:"path",rules:{pattern:/^(?!.*\.\.).*$/,message:()=>e.$t("v.url")}},{label:n((()=>[m(N,{message:"config.storage.path"})])),default:n((()=>[m(o,{modelValue:R.value.path,"onUpdate:modelValue":l[15]||(l[15]=e=>R.value.path=e),maxlength:"160"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:24},{default:n((()=>[m(x,{prop:"url",rules:{pattern:/^(?!.*\.\.).*$/,message:()=>e.$t("v.url")}},{label:n((()=>[m(N,{message:"config.storage.url"})])),default:n((()=>[m(o,{modelValue:R.value.url,"onUpdate:modelValue":l[16]||(l[16]=e=>R.value.url=e),maxlength:"160"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),1===R.value.type?(i(),p(f,{key:0},[m(q,{span:24},{default:n((()=>[m(x,{prop:"endpoint",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(N,{message:"config.storage.endpoint"})])),default:n((()=>[m(o,{modelValue:R.value.endpoint,"onUpdate:modelValue":l[17]||(l[17]=e=>R.value.endpoint=e),maxlength:"160"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:12},{default:n((()=>[m(x,{prop:"region",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(N,{message:"config.storage.region"})])),default:n((()=>[m(o,{modelValue:R.value.region,"onUpdate:modelValue":l[18]||(l[18]=e=>R.value.region=e),maxlength:"160"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:12},{default:n((()=>[m(x,{prop:"bucket",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(N,{message:"config.storage.bucket"})])),default:n((()=>[m(o,{modelValue:R.value.bucket,"onUpdate:modelValue":l[19]||(l[19]=e=>R.value.bucket=e),maxlength:"160"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:24},{default:n((()=>[m(x,{prop:"accessKey",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(N,{message:"config.storage.accessKey"})])),default:n((()=>[m(o,{modelValue:R.value.accessKey,"onUpdate:modelValue":l[20]||(l[20]=e=>R.value.accessKey=e),type:"password","show-password":"",maxlength:"160"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:24},{default:n((()=>[m(x,{prop:"secretKey",rules:{required:!0,message:()=>e.$t("v.required")}},{label:n((()=>[m(N,{message:"config.storage.secretKey"})])),default:n((()=>[m(o,{modelValue:R.value.secretKey,"onUpdate:modelValue":l[21]||(l[21]=e=>R.value.secretKey=e),type:"password","show-password":"",maxlength:"160"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1})],64)):y("",!0)])),_:1})):"customs"===B.value?(i(),r($,{key:2},{default:n((()=>[(i(!0),p(f,null,g(v(Q),(l=>(i(),r(q,{key:l.code,span:l.double?12:24},{default:n((()=>[m(x,{prop:l.code,label:l.name,rules:l.required?{required:!0,message:()=>e.$t("v.required")}:void 0},{default:n((()=>[m(F,{field:l,modelValue:R.value[l.code],"onUpdate:modelValue":e=>R.value[l.code]=e},null,8,["field","modelValue","onUpdate:modelValue"])])),_:2},1032,["prop","label","rules"])])),_:2},1032,["span"])))),128))])),_:1})):(i(),r($,{key:3},{default:n((()=>[m(q,{span:12},{default:n((()=>[m(x,{prop:"port",rules:{type:"number",min:0,max:65535,message:()=>e.$t("v.range",{min:0,max:65535})}},{label:n((()=>[m(N,{message:"config.port",help:""})])),default:n((()=>[m(o,{modelValue:R.value.port,"onUpdate:modelValue":l[22]||(l[22]=e=>R.value.port=e),modelModifiers:{number:!0}},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:12},{default:n((()=>[m(x,{prop:"contextPath"},{label:n((()=>[m(N,{message:"config.contextPath",help:""})])),default:n((()=>[m(o,{modelValue:R.value.contextPath,"onUpdate:modelValue":l[23]||(l[23]=e=>R.value.contextPath=e),maxlength:"50"},null,8,["modelValue"])])),_:1})])),_:1}),m(q,{span:12},{default:n((()=>[m(x,{prop:"channelUrl",rules:{pattern:/^\/[\w-]+$/,message:()=>e.$t("config.error.channelUrlPattern")}},{label:n((()=>[m(N,{message:"config.channelUrl",help:""})])),default:n((()=>[m(o,{modelValue:R.value.channelUrl,"onUpdate:modelValue":l[24]||(l[24]=e=>R.value.channelUrl=e),maxlength:"50"},null,8,["modelValue"])])),_:1},8,["rules"])])),_:1}),m(q,{span:12},{default:n((()=>[m(x,{prop:"articleUrl"},{label:n((()=>[m(N,{message:"config.articleUrl",help:""})])),default:n((()=>[m(o,{modelValue:R.value.articleUrl,"onUpdate:modelValue":l[25]||(l[25]=e=>R.value.articleUrl=e),maxlength:"50"},null,8,["modelValue"])])),_:1})])),_:1}),m(q,{span:12},{default:n((()=>[m(x,{prop:"defaultSiteId",label:e.$t("config.defaultSite")},{default:n((()=>[m(L,{modelValue:R.value.defaultSiteId,"onUpdate:modelValue":l[26]||(l[26]=e=>R.value.defaultSiteId=e),options:G.value,props:{value:"id",label:"name",checkStrictly:!0},onChange:l[27]||(l[27]=e=>R.value.defaultSiteId=null==e?void 0:e[e.length-1]),class:"w-full"},null,8,["modelValue","options"])])),_:1},8,["label"])])),_:1}),m(q,{span:12},{default:n((()=>[m(x,{prop:"multiDomain"},{label:n((()=>[m(N,{message:"config.multiDomain",help:""})])),default:n((()=>[m(T,{modelValue:R.value.multiDomain,"onUpdate:modelValue":l[28]||(l[28]=e=>R.value.multiDomain=e)},null,8,["modelValue"])])),_:1})])),_:1})])),_:1})),V("div",null,[m(k,{disabled:v(W)(`config:${B.value}:update`),loading:E.value,onClick:b(le,["prevent"]),type:"primary","native-type":"submit"},{default:n((()=>[_(h(e.$t("submit")),1)])),_:1},8,["disabled","loading","onClick"])])])),_:1},8,["model"])),[[I,A.value]])])),_:1})])),_:1})}}}),[["__scopeId","data-v-38fbba38"]]))}}}))}();