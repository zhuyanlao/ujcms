System.register(["./config-legacy-c2b5a22c.js","./content-legacy-981e3aca.js","./DialogForm.vue_vue_type_script_setup_true_lang-legacy-784148f6.js","./BaseUpload.vue_vue_type_style_index_0_scoped_5165bd65_lang-legacy-554ece36.js","./index-legacy-9a017ff0.js","./BaseUpload-legacy-96847376.js"],(function(e,l){"use strict";var a,t,u,d,i,r,o,n,m,s,c,p,b,v,g,k,V,h,I,y,f,_,q,$,U,B,w,x,j;return{setters:[e=>{a=e.a},e=>{t=e.n,u=e.t,d=e.v,i=e.m},e=>{r=e.a,o=e._},e=>{n=e.a},e=>{m=e.d,s=e.p,c=e.r,p=e.v,b=e.a,v=e.c,g=e.e,k=e.w,V=e.h,h=e.k,I=e.t,y=e.I,f=e.a8,_=e.a7,q=e.j,$=e.Z,U=e.X,B=e.o,w=e.g,x=e.i},e=>{j=e.B}],execute:function(){const l=["onClick"],R=["src"],T=e("_",m({__name:"ImageExtractor",props:{modelValue:{type:Boolean,required:!0},urls:{type:Array,default:[]},min:{type:Number,default:1},max:{type:Number,default:1},appendToBody:{type:Boolean}},emits:["update:modelValue","finished"],setup(e,{emit:a}){const t=e,{urls:u,max:d,modelValue:i}=s(t),o=c();return p(i,(()=>{i.value&&(o.value=r.uniq(u.value).map((e=>({url:e,checked:!1}))))})),(t,u)=>{const i=b("el-col"),r=b("el-row"),n=b("el-button"),m=b("el-dialog");return v(),g(m,{"model-value":e.modelValue,"onUpdate:modelValue":u[1]||(u[1]=e=>t.$emit("update:modelValue",e)),title:t.$t("article.extractImage"),width:768,"append-to-body":e.appendToBody},{footer:k((()=>[V(n,{type:"primary",onClick:u[0]||(u[0]=e=>(a("finished",o.value.filter((e=>e.checked)).map((e=>e.url))),void a("update:modelValue",!1))),disabled:o.value.filter((e=>e.checked)).length<e.min},{default:k((()=>[h(I(t.$t("ok")),1)])),_:1},8,["disabled"])])),default:k((()=>[V(r,{gutter:16},{default:k((()=>[(v(!0),y(_,null,f(o.value,((e,a)=>(v(),g(i,{src:e,key:e.url,span:8,class:"mt-2"},{default:k((()=>[q("div",{class:$(["p-1 border-2 rounded cursor-pointer text-center",{"border-primary":e.checked,"border-2":e.checked}]),onClick:l=>(e=>{if(e.checked)return void(e.checked=!e.checked);let l=0;o.value.forEach((e=>{e.checked&&(l+=1),l>=d.value&&(e.checked=!1)})),e.checked=!0})(e)},[q("img",{src:e.url,class:"max-h-36 inline"},null,8,R)],10,l)])),_:2},1032,["src"])))),128))])),_:1})])),_:1},8,["model-value","title","append-to-body"])}}}));e("a",m({name:"BlockItemForm",props:{modelValue:{type:Boolean,required:!0},beanId:{required:!0},beanIds:{type:Array,required:!0},blockId:{type:Number},articleId:{type:Number},title:{type:String},description:{type:String},video:{type:String},images:{type:Array,default:[]}},emits:{"update:modelValue":null,finished:null},setup(e){const l=e,{blockId:r}=s(l),m=c(),p=c(),q=c({}),$=c([]),R=U((()=>$.value.find((e=>e.id===(m.value??r?.value)))));B((async()=>{$.value=await a()}));const C=c(!1);return(l,a)=>{const s=b("el-option"),c=b("el-select"),U=b("el-form-item"),B=b("el-input"),S=b("el-button"),F=b("el-switch");return v(),y("div",null,[V(o,{name:l.$t("menu.content.blockItem"),queryBean:x(t),createBean:x(u),updateBean:x(d),deleteBean:x(i),beanId:e.beanId,beanIds:e.beanIds,focus:p.value,initValues:()=>({blockId:x(r),articleId:e.articleId,title:e.title,description:e.description,video:e.video}),toValues:e=>({...e,articleTitle:e.article?.title,articleId:e.article?.id}),addable:x(R)?.enabled,perms:"blockItem",values:q.value,"onUpdate:values":a[14]||(a[14]=e=>q.value=e),"model-value":e.modelValue,"onUpdate:modelValue":a[15]||(a[15]=e=>l.$emit("update:modelValue",e)),onFinished:a[16]||(a[16]=e=>l.$emit("finished")),onBeanChange:a[17]||(a[17]=e=>m.value=e.blockId)},{default:k((({isEdit:t})=>[V(U,{prop:"blockId",label:l.$t("blockItem.block"),rules:{required:!0,message:()=>l.$t("v.required")}},{default:k((()=>[V(c,{modelValue:q.value.blockId,"onUpdate:modelValue":a[0]||(a[0]=e=>q.value.blockId=e),class:"w-full",onChange:a[1]||(a[1]=e=>m.value=e),disabled:""},{default:k((()=>[(v(!0),y(_,null,f($.value,(e=>(v(),y(_,{key:e.id},[t||e.enabled?(v(),g(s,{key:0,label:e.name,value:e.id,disabled:!e.enabled},null,8,["label","value","disabled"])):w("",!0)],64)))),128))])),_:2},1032,["modelValue"])])),_:2},1032,["label","rules"]),t&&null!=q.value.articleId?(v(),g(U,{key:0,label:l.$t("blockItem.articleId")},{default:k((()=>[V(B,{modelValue:q.value.articleId,"onUpdate:modelValue":a[2]||(a[2]=e=>q.value.articleId=e),disabled:""},null,8,["modelValue"])])),_:1},8,["label"])):w("",!0),t&&null!=q.value.articleTitle?(v(),g(U,{key:1,label:l.$t("blockItem.articleTitle")},{default:k((()=>[V(B,{modelValue:q.value.articleTitle,"onUpdate:modelValue":a[3]||(a[3]=e=>q.value.articleTitle=e),disabled:""},null,8,["modelValue"])])),_:1},8,["label"])):w("",!0),V(U,{prop:"title",label:l.$t("blockItem.title"),rules:{required:!0,message:()=>l.$t("v.required")}},{default:k((()=>[V(B,{modelValue:q.value.title,"onUpdate:modelValue":a[4]||(a[4]=e=>q.value.title=e),ref_key:"focus",ref:p,maxlength:"150"},null,8,["modelValue"])])),_:1},8,["label","rules"]),null==q.value.articleId&&x(R)?.withLinkUrl?(v(),g(U,{key:2,prop:"linkUrl",label:l.$t("blockItem.linkUrl"),rules:x(R)?.linkUrlRequired?[{required:!0,message:()=>l.$t("v.required")},{pattern:/^(http|\/).*$/,message:()=>l.$t("blockItem.error.linkUrl")}]:{pattern:/^(http|\/).*$/,message:()=>l.$t("blockItem.error.linkUrl")}},{default:k((()=>[V(B,{modelValue:q.value.linkUrl,"onUpdate:modelValue":a[5]||(a[5]=e=>q.value.linkUrl=e),maxlength:"255"},null,8,["modelValue"])])),_:1},8,["label","rules"])):w("",!0),x(R)?.withSubtitle?(v(),g(U,{key:3,prop:"subtitle",label:l.$t("blockItem.subtitle"),rules:{required:x(R)?.subtitleRequired,message:()=>l.$t("v.required")}},{default:k((()=>[V(B,{modelValue:q.value.subtitle,"onUpdate:modelValue":a[6]||(a[6]=e=>q.value.subtitle=e),maxlength:"150"},null,8,["modelValue"])])),_:1},8,["label","rules"])):w("",!0),x(R)?.withDescription?(v(),g(U,{key:4,prop:"description",label:l.$t("blockItem.description"),rules:{required:x(R)?.descriptionRequired,message:()=>l.$t("v.required")}},{default:k((()=>[V(B,{modelValue:q.value.description,"onUpdate:modelValue":a[7]||(a[7]=e=>q.value.description=e),type:"textarea",rows:5,maxlength:"1000"},null,8,["modelValue"])])),_:1},8,["label","rules"])):w("",!0),x(R)?.withImage?(v(),g(U,{key:5,prop:"image",label:l.$t("blockItem.image"),rules:{required:x(R)?.imageRequired,message:()=>l.$t("v.required")}},{default:k((()=>[V(x(n),{modelValue:q.value.image,"onUpdate:modelValue":a[8]||(a[8]=e=>q.value.image=e),width:x(R).imageWidth,height:x(R).imageHeight,mode:"manual"},null,8,["modelValue","width","height"]),e.images.length>0?(v(),g(S,{key:0,class:"ml-2 self-start",onClick:a[9]||(a[9]=e=>C.value=!0)},{default:k((()=>[h(I(l.$t("article.extractImage")),1)])),_:1})):w("",!0)])),_:1},8,["label","rules"])):w("",!0),x(R)?.withMobileImage?(v(),g(U,{key:6,prop:"mobileImage",label:l.$t("blockItem.mobileImage"),rules:{required:x(R)?.mobileImageRequired,message:()=>l.$t("v.required")}},{default:k((()=>[V(x(n),{modelValue:q.value.mobileImage,"onUpdate:modelValue":a[10]||(a[10]=e=>q.value.mobileImage=e),width:x(R).mobileImageWidth,height:x(R).mobileImageHeight,mode:"manual"},null,8,["modelValue","width","height"])])),_:1},8,["label","rules"])):w("",!0),x(R)?.withVideo?(v(),g(U,{key:7,prop:"video",label:l.$t("blockItem.video"),rules:{required:x(R)?.videoRequired,message:()=>l.$t("v.required")}},{default:k((()=>[V(B,{modelValue:q.value.video,"onUpdate:modelValue":a[11]||(a[11]=e=>q.value.video=e),maxlength:"255"},{prepend:k((()=>[h("URL")])),_:1},8,["modelValue"]),V(x(j),{type:"video","on-success":e=>q.value.video=e.url},null,8,["on-success"])])),_:1},8,["label","rules"])):w("",!0),V(U,{prop:"targetBlank",label:l.$t("blockItem.targetBlank"),rules:{required:!0,message:()=>l.$t("v.required")}},{default:k((()=>[V(F,{modelValue:q.value.targetBlank,"onUpdate:modelValue":a[12]||(a[12]=e=>q.value.targetBlank=e)},null,8,["modelValue"])])),_:1},8,["label","rules"]),V(U,{prop:"enabled",label:l.$t("blockItem.enabled"),rules:{required:!0,message:()=>l.$t("v.required")}},{default:k((()=>[V(F,{modelValue:q.value.enabled,"onUpdate:modelValue":a[13]||(a[13]=e=>q.value.enabled=e)},null,8,["modelValue"])])),_:1},8,["label","rules"])])),_:1},8,["name","queryBean","createBean","updateBean","deleteBean","beanId","beanIds","focus","initValues","toValues","addable","values","model-value"]),V(T,{modelValue:C.value,"onUpdate:modelValue":a[18]||(a[18]=e=>C.value=e),urls:e.images,"append-to-body":!0,onFinished:a[19]||(a[19]=e=>q.value.image=e[0])},null,8,["modelValue","urls"])])}}}))}}}));