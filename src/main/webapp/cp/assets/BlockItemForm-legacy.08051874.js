System.register(["./config-legacy.9c873c89.js","./content-legacy.de5344a2.js","./DialogForm-legacy.767cf762.js","./BaseUpload.vue_vue_type_style_index_0_scoped_true_lang-legacy.e1aede23.js","./index-legacy.bb3d5eb8.js","./vendor-legacy.c673f215.js"],(function(e){"use strict";var l,a,t,u,i,d,o,n,r,m,s,c,b,v,p,g,I,k,V,f,h,y;return{setters:[function(e){l=e.a},function(e){a=e.m,t=e.n,u=e.t,i=e.l},function(e){d=e._},function(e){o=e.a},function(){},function(e){n=e.g,r=e.t,m=e.I,s=e.i,c=e.M,b=e.j,v=e.o,p=e.k,g=e.w,I=e.l,k=e.q,V=e.C,f=e.F,h=e.x,y=e.m}],execute:function(){e("_",n({name:"BlockItemForm",props:{modelValue:{type:Boolean,required:!0},beanId:{required:!0},beanIds:{type:Array,required:!0},blockId:{type:Number},articleId:{type:Number},title:{type:String},description:{type:String}},emits:{"update:modelValue":null,finished:null},setup(e){const n=e,{blockId:q}=r(n),_=m(),$=m(),U=m({}),w=m([]),B=s((()=>w.value.find((e=>{var l;return e.id===(null!==(l=_.value)&&void 0!==l?l:null==q?void 0:q.value)}))));return c((async()=>{w.value=await l()})),(l,n)=>{var r;const m=b("el-option"),s=b("el-select"),c=b("el-form-item"),x=b("el-input");return v(),p(d,{name:l.$t("menu.content.blockItem"),queryBean:y(a),createBean:y(t),updateBean:y(u),deleteBean:y(i),beanId:e.beanId,beanIds:e.beanIds,focus:$.value,initValues:()=>({blockId:y(q),articleId:e.articleId,title:e.title,description:e.description}),toValues:e=>{var l,a;return{...e,articleTitle:null===(l=e.article)||void 0===l?void 0:l.title,articleId:null===(a=e.article)||void 0===a?void 0:a.id}},addable:null===(r=y(B))||void 0===r?void 0:r.enabled,perms:"blockItem",values:U.value,"onUpdate:values":n[10]||(n[10]=e=>U.value=e),"model-value":e.modelValue,"onUpdate:modelValue":n[11]||(n[11]=e=>l.$emit("update:modelValue",e)),onFinished:n[12]||(n[12]=e=>l.$emit("finished")),onBeanChange:n[13]||(n[13]=e=>_.value=e.blockId)},{default:g((({isEdit:e})=>{var a,t,u,i,d,r,b,q,j,R;return[I(c,{prop:"blockId",label:l.$t("blockItem.block"),rules:{required:!0,message:()=>l.$t("v.required")}},{default:g((()=>[I(s,{modelValue:U.value.blockId,"onUpdate:modelValue":n[0]||(n[0]=e=>U.value.blockId=e),class:"w-full",onChange:n[1]||(n[1]=e=>_.value=e),disabled:""},{default:g((()=>[(v(!0),k(f,null,V(w.value,(l=>(v(),k(f,{key:l.id},[e||l.enabled?(v(),p(m,{key:0,label:l.name,value:l.id,disabled:!l.enabled},null,8,["label","value","disabled"])):h("",!0)],64)))),128))])),_:2},1032,["modelValue"])])),_:2},1032,["label","rules"]),e&&null!=U.value.articleId?(v(),p(c,{key:0,label:l.$t("blockItem.articleId")},{default:g((()=>[I(x,{modelValue:U.value.articleId,"onUpdate:modelValue":n[2]||(n[2]=e=>U.value.articleId=e),disabled:""},null,8,["modelValue"])])),_:1},8,["label"])):h("",!0),e&&null!=U.value.articleTitle?(v(),p(c,{key:1,label:l.$t("blockItem.articleTitle")},{default:g((()=>[I(x,{modelValue:U.value.articleTitle,"onUpdate:modelValue":n[3]||(n[3]=e=>U.value.articleTitle=e),disabled:""},null,8,["modelValue"])])),_:1},8,["label"])):h("",!0),I(c,{prop:"title",label:l.$t("blockItem.title"),rules:{required:!0,message:()=>l.$t("v.required")}},{default:g((()=>[I(x,{modelValue:U.value.title,"onUpdate:modelValue":n[4]||(n[4]=e=>U.value.title=e),ref_key:"focus",ref:$,maxlength:"150"},null,8,["modelValue"])])),_:1},8,["label","rules"]),null==U.value.articleId&&null!==(a=y(B))&&void 0!==a&&a.withLinkUrl?(v(),p(c,{key:2,prop:"linkUrl",label:l.$t("blockItem.linkUrl"),rules:{required:null===(t=y(B))||void 0===t?void 0:t.linkUrlRequired,message:()=>l.$t("v.required")}},{default:g((()=>[I(x,{modelValue:U.value.linkUrl,"onUpdate:modelValue":n[5]||(n[5]=e=>U.value.linkUrl=e),maxlength:"255"},null,8,["modelValue"])])),_:1},8,["label","rules"])):h("",!0),null!==(u=y(B))&&void 0!==u&&u.withSubtitle?(v(),p(c,{key:3,prop:"subtitle",label:l.$t("blockItem.subtitle"),rules:{required:null===(i=y(B))||void 0===i?void 0:i.subtitleRequired,message:()=>l.$t("v.required")}},{default:g((()=>[I(x,{modelValue:U.value.subtitle,"onUpdate:modelValue":n[6]||(n[6]=e=>U.value.subtitle=e),maxlength:"150"},null,8,["modelValue"])])),_:1},8,["label","rules"])):h("",!0),null!==(d=y(B))&&void 0!==d&&d.withDescription?(v(),p(c,{key:4,prop:"description",label:l.$t("blockItem.description"),rules:{required:null===(r=y(B))||void 0===r?void 0:r.descriptionRequired,message:()=>l.$t("v.required")}},{default:g((()=>[I(x,{modelValue:U.value.description,"onUpdate:modelValue":n[7]||(n[7]=e=>U.value.description=e),type:"textarea",rows:5,maxlength:"1000"},null,8,["modelValue"])])),_:1},8,["label","rules"])):h("",!0),null!==(b=y(B))&&void 0!==b&&b.withImage?(v(),p(c,{key:5,prop:"image",label:l.$t("blockItem.image"),rules:{required:null===(q=y(B))||void 0===q?void 0:q.imageRequired,message:()=>l.$t("v.required")}},{default:g((()=>[I(y(o),{modelValue:U.value.image,"onUpdate:modelValue":n[8]||(n[8]=e=>U.value.image=e),width:y(B).imageWidth,height:y(B).imageHeight,mode:"manual"},null,8,["modelValue","width","height"])])),_:1},8,["label","rules"])):h("",!0),null!==(j=y(B))&&void 0!==j&&j.withMobileImage?(v(),p(c,{key:6,prop:"mobileImage",label:l.$t("blockItem.mobileImage"),rules:{required:null===(R=y(B))||void 0===R?void 0:R.mobileImageRequired,message:()=>l.$t("v.required")}},{default:g((()=>[I(y(o),{modelValue:U.value.mobileImage,"onUpdate:modelValue":n[9]||(n[9]=e=>U.value.mobileImage=e),width:y(B).mobileImageWidth,height:y(B).mobileImageHeight,mode:"manual"},null,8,["modelValue","width","height"])])),_:1},8,["label","rules"])):h("",!0)]})),_:1},8,["name","queryBean","createBean","updateBean","deleteBean","beanId","beanIds","focus","initValues","toValues","addable","values","model-value"])}}}))}}}));
