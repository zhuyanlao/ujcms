import{d as ze,p as Je,r as v,X as J,v as Xe,a as w,c as m,e as f,w as t,i as e,h as l,k as U,t as S,g as $,I as T,a7 as M,a8 as A,V as H,_ as Ge,u as He,o as Ye,b as Ze,j as ue,f as xe,aD as el,aI as ll,E as al,cr as nl,as as W,a4 as tl,a1 as ol}from"./index-07310ff6.js";import{t as Ee,d as sl,a as ul,f as De,b as rl}from"./tree-7e647485.js";import{x as dl,y as il,z as ml,A as Fe,f as Re,B as pl,g as cl,C as Ae,D as vl}from"./content-57570363.js";import{a as je}from"./system-8003f925.js";import{a as fl,_ as hl,b as bl,c as yl}from"./QueryItem.vue_vue_type_script_setup_true_lang-a4f060b2.js";import{_ as wl}from"./ListMove.vue_vue_type_script_setup_true_lang-94f3400b.js";import{q as Be}from"./config-e88c2eae.js";import{a as Ke,m as Le,g as Pe}from"./data-64029703.js";import{T as Vl,_ as $l}from"./FieldItem.vue_vue_type_script_setup_true_lang-27c5ec02.js";import{_ as gl}from"./DialogForm.vue_vue_type_script_setup_true_lang-84cdaac8.js";import{_ as ae}from"./LabelTip.vue_vue_type_script_setup_true_lang-2883fbbc.js";import"./BaseUpload.vue_vue_type_style_index_0_scoped_5165bd65_lang-452c0238.js";import"./BaseUpload-96a78565.js";const _l={name:"ChannelForm"},kl=ze({..._l,props:{modelValue:{type:Boolean,required:!0},beanId:{required:!0},beanIds:{type:Array,required:!0},parent:{type:Object,default:null}},emits:{"update:modelValue":null,finished:null},setup(X,{emit:ne}){const j=X,{modelValue:D,parent:V}=Je(j),q=v(),u=v({}),N=v([]),z=v([]),k=v([]),O=v([]),B=v([]),E=v([]),Q=v([]),I=v(),F=J(()=>k.value.find(a=>a.id===I.value)),s=J(()=>{var a;return Ke(Le(Pe().channel.mains,(a=F.value)==null?void 0:a.mains,"channel"))}),R=J(()=>{var a;return Ke(Le(Pe().channel.asides,(a=F.value)==null?void 0:a.asides,"channel"))}),Y=J(()=>{var a;return JSON.parse(((a=F.value)==null?void 0:a.customs)||"[]")}),te=J(()=>{const a=sl(z.value,u.value.id);return H.allChannelPermission?a:ul(a,B.value)}),G=async()=>{z.value=Ee(await Re())},oe=async()=>{H.epRank>0&&(N.value=await je({category:"sys_article",latestVersion:!0}))},Z=async()=>{await G(),ne("finished")},x=async()=>{k.value=await Be({type:"channel"}),I.value==null&&k.value.length>0&&(I.value=k.value[0].id)},ee=async()=>{O.value=await Be({type:"article"})},se=async()=>{E.value=await pl()},i=async()=>{Q.value=await cl()},b=async()=>{B.value=await Ae()};Xe(D,()=>{var a,o,C;D.value&&(I.value=(C=(a=V.value)==null?void 0:a.articleModelId)!=null?C:(o=k.value[0])==null?void 0:o.id,b(),x(),ee(),se(),i(),G(),oe())});const _=a=>(Y.value.forEach(o=>{a[o.code]=o.defaultValue}),a);return(a,o)=>{const C=w("el-input"),c=w("el-form-item"),h=w("el-col"),p=w("el-checkbox"),g=w("el-option"),K=w("el-select"),le=w("el-switch"),re=w("el-row"),Ne=w("el-tree-select"),Oe=w("el-input-number"),Qe=w("el-tab-pane"),We=w("el-tabs");return m(),f(gl,{name:a.$t("menu.content.channel"),queryBean:e(dl),createBean:e(il),updateBean:e(ml),deleteBean:e(Fe),beanId:X.beanId,beanIds:X.beanIds,focus:q.value,initValues:d=>{var n,r,L,P,y,de,ie,me,pe,ce,ve,fe,he,be,ye,we,Ve,$e,ge,_e,ke,Ce,qe,Te,Ie,Me,Ue,Se;return{parentId:(r=d==null?void 0:d.parentId)!=null?r:(n=e(V))==null?void 0:n.id,type:1,channelModelId:(de=(P=d==null?void 0:d.channelModelId)!=null?P:(L=e(V))==null?void 0:L.channelModelId)!=null?de:(y=k.value[0])==null?void 0:y.id,articleModelId:(ce=(me=d==null?void 0:d.articleModelId)!=null?me:(ie=e(V))==null?void 0:ie.articleModelId)!=null?ce:(pe=O.value[0])==null?void 0:pe.id,nav:(he=(fe=d==null?void 0:d.nav)!=null?fe:(ve=e(V))==null?void 0:ve.nav)!=null?he:!0,channelTemplate:(we=(ye=d==null?void 0:d.channelTemplate)!=null?ye:(be=e(V))==null?void 0:be.channelTemplate)!=null?we:E.value[0],articleTemplate:(ge=($e=d==null?void 0:d.articleTemplate)!=null?$e:(Ve=e(V))==null?void 0:Ve.articleTemplate)!=null?ge:Q.value[0],pageSize:20,allowComment:(Ce=(ke=d==null?void 0:d.allowComment)!=null?ke:(_e=e(V))==null?void 0:_e.allowComment)!=null?Ce:!0,allowContribute:(Ie=(Te=d==null?void 0:d.allowContribute)!=null?Te:(qe=e(V))==null?void 0:qe.allowContribute)!=null?Ie:!0,allowSearch:(Se=(Ue=d==null?void 0:d.allowSearch)!=null?Ue:(Me=e(V))==null?void 0:Me.allowSearch)!=null?Se:!0,customs:_({})}},toValues:d=>({...d}),perms:"channel",values:u.value,"onUpdate:values":o[20]||(o[20]=d=>u.value=d),"model-value":X.modelValue,"onUpdate:modelValue":o[21]||(o[21]=d=>a.$emit("update:modelValue",d)),onFinished:Z,onBeanChange:o[22]||(o[22]=d=>{var n,r,L,P;I.value=(P=(r=d==null?void 0:d.channelModelId)!=null?r:(n=e(V))==null?void 0:n.channelModelId)!=null?P:(L=O.value[0])==null?void 0:L.id,G()}),disableEdit:d=>!e(H).allChannelPermission&&d.id!=null&&!B.value.includes(d.id),labelWidth:"120px",large:""},{default:t(({isEdit:d})=>[l(re,null,{default:t(()=>[l(h,{span:18},{default:t(()=>[l(re,null,{default:t(()=>[l(h,{span:e(s).name.double?12:24},{default:t(()=>{var n;return[l(c,{prop:"name",label:(n=e(s).name.name)!=null?n:a.$t("channel.name"),rules:{required:!0,message:()=>a.$t("v.required")}},{default:t(()=>[l(C,{modelValue:u.value.name,"onUpdate:modelValue":o[0]||(o[0]=r=>u.value.name=r),ref_key:"focus",ref:q,maxlength:"50"},null,8,["modelValue"])]),_:1},8,["label","rules"])]}),_:1},8,["span"]),l(h,{span:e(s).alias.double?12:24},{default:t(()=>[l(c,{prop:"alias",rules:[{required:!0,message:()=>a.$t("v.required")},{pattern:/^[\w-]*$/,message:()=>a.$t("channel.error.aliasPattern")}]},{label:t(()=>{var n;return[l(ae,{label:(n=e(s).alias.name)!=null?n:a.$t("channel.alias"),message:"channel.alias",help:""},null,8,["label"])]}),default:t(()=>[l(C,{modelValue:u.value.alias,"onUpdate:modelValue":o[1]||(o[1]=n=>u.value.alias=n),maxlength:"50"},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1},8,["span"]),u.value.type===3?(m(),f(h,{key:0,span:e(s).linkUrl.double?12:24},{default:t(()=>[l(c,{prop:"linkUrl",rules:[{required:!0,message:()=>a.$t("v.required")},{pattern:/^(http|\/).*$/,message:()=>a.$t("channel.error.linkUrl")}]},{label:t(()=>{var n;return[l(ae,{label:(n=e(s).linkUrl.name)!=null?n:a.$t("channel.linkUrl"),message:"channel.linkUrl",help:""},null,8,["label"])]}),default:t(()=>[l(C,{modelValue:u.value.linkUrl,"onUpdate:modelValue":o[3]||(o[3]=n=>u.value.linkUrl=n),maxlength:"255"},{append:t(()=>[l(p,{modelValue:u.value.targetBlank,"onUpdate:modelValue":o[2]||(o[2]=n=>u.value.targetBlank=n)},{default:t(()=>[U(S(a.$t("channel.targetBlank")),1)]),_:1},8,["modelValue"])]),_:1},8,["modelValue"])]),_:1},8,["rules"])]),_:1},8,["span"])):$("",!0),u.value.type<3?(m(),T(M,{key:1},[e(s).seoTitle.show?(m(),f(h,{key:0,span:e(s).seoTitle.double?12:24},{default:t(()=>{var n;return[l(c,{prop:"seoTitle",label:(n=e(s).seoTitle.name)!=null?n:a.$t("channel.seoTitle"),rules:e(s).seoTitle.required?{required:!0,message:()=>a.$t("v.required")}:void 0},{default:t(()=>[l(C,{modelValue:u.value.seoTitle,"onUpdate:modelValue":o[4]||(o[4]=r=>u.value.seoTitle=r),maxlength:"150"},null,8,["modelValue"])]),_:1},8,["label","rules"])]}),_:1},8,["span"])):$("",!0),e(s).seoKeywords.show?(m(),f(h,{key:1,span:e(s).seoKeywords.double?12:24},{default:t(()=>{var n;return[l(c,{prop:"seoKeywords",label:(n=e(s).seoKeywords.name)!=null?n:a.$t("channel.seoKeywords"),rules:e(s).seoKeywords.required?{required:!0,message:()=>a.$t("v.required")}:void 0},{default:t(()=>[l(C,{modelValue:u.value.seoKeywords,"onUpdate:modelValue":o[5]||(o[5]=r=>u.value.seoKeywords=r),maxlength:"150"},null,8,["modelValue"])]),_:1},8,["label","rules"])]}),_:1},8,["span"])):$("",!0),e(s).seoDescription.show?(m(),f(h,{key:2,span:e(s).seoDescription.double?12:24},{default:t(()=>{var n;return[l(c,{prop:"seoDescription",label:(n=e(s).seoDescription.name)!=null?n:a.$t("channel.seoDescription"),rules:e(s).seoDescription.required?{required:!0,message:()=>a.$t("v.required")}:void 0},{default:t(()=>[l(C,{modelValue:u.value.seoDescription,"onUpdate:modelValue":o[6]||(o[6]=r=>u.value.seoDescription=r),maxlength:"1000"},null,8,["modelValue"])]),_:1},8,["label","rules"])]}),_:1},8,["span"])):$("",!0)],64)):$("",!0),e(s).channelModel.show?(m(),f(h,{key:2,span:e(s).channelModel.double?12:24},{default:t(()=>{var n;return[l(c,{prop:"channelModelId",label:(n=e(s).channelModel.name)!=null?n:a.$t("channel.channelModel"),rules:{required:!0,message:()=>a.$t("v.required")}},{default:t(()=>[l(K,{modelValue:u.value.channelModelId,"onUpdate:modelValue":o[7]||(o[7]=r=>u.value.channelModelId=r),class:"w-full",onChange:r=>{I.value=r,d||a.$nextTick().then(()=>{_(u.value.customs)})}},{default:t(()=>[(m(!0),T(M,null,A(k.value,r=>(m(),f(g,{key:r.id,label:r.name,value:r.id},null,8,["label","value"]))),128))]),_:2},1032,["modelValue","onChange"])]),_:2},1032,["label","rules"])]}),_:2},1032,["span"])):$("",!0),e(s).articleModel.show?(m(),f(h,{key:3,span:e(s).articleModel.double?12:24},{default:t(()=>{var n;return[l(c,{prop:"articleModelId",label:(n=e(s).articleModel.name)!=null?n:a.$t("channel.articleModel"),rules:{required:!0,message:()=>a.$t("v.required")}},{default:t(()=>[l(K,{modelValue:u.value.articleModelId,"onUpdate:modelValue":o[8]||(o[8]=r=>u.value.articleModelId=r),class:"w-full"},{default:t(()=>[(m(!0),T(M,null,A(O.value,r=>(m(),f(g,{key:r.id,label:r.name,value:r.id},null,8,["label","value"]))),128))]),_:1},8,["modelValue"])]),_:1},8,["label","rules"])]}),_:1},8,["span"])):$("",!0),[3,4,5].includes(u.value.type)?$("",!0):(m(),T(M,{key:4},[e(s).channelTemplate.show?(m(),f(h,{key:0,span:e(s).channelTemplate.double?12:24},{default:t(()=>{var n;return[l(c,{prop:"channelTemplate",label:(n=e(s).channelTemplate.name)!=null?n:a.$t("channel.channelTemplate"),rules:e(s).channelTemplate.required?{required:!0,message:()=>a.$t("v.required")}:void 0},{default:t(()=>[l(K,{modelValue:u.value.channelTemplate,"onUpdate:modelValue":o[9]||(o[9]=r=>u.value.channelTemplate=r),class:"w-full"},{default:t(()=>[(m(!0),T(M,null,A(E.value,r=>(m(),f(g,{key:r,label:r+".html",value:r},null,8,["label","value"]))),128))]),_:1},8,["modelValue"])]),_:1},8,["label","rules"])]}),_:1},8,["span"])):$("",!0),e(s).articleTemplate.show?(m(),f(h,{key:1,span:e(s).articleTemplate.double?12:24},{default:t(()=>{var n;return[l(c,{prop:"articleTemplate",label:(n=e(s).articleTemplate.name)!=null?n:a.$t("channel.articleTemplate"),rules:e(s).articleTemplate.required?{required:!0,message:()=>a.$t("v.required")}:void 0},{default:t(()=>[l(K,{modelValue:u.value.articleTemplate,"onUpdate:modelValue":o[10]||(o[10]=r=>u.value.articleTemplate=r),class:"w-full"},{default:t(()=>[(m(!0),T(M,null,A(Q.value,r=>(m(),f(g,{key:r,label:r+".html",value:r},null,8,["label","value"]))),128))]),_:1},8,["modelValue"])]),_:1},8,["label","rules"])]}),_:1},8,["span"])):$("",!0)],64)),e(s).allowComment.show?(m(),f(h,{key:5,span:e(s).allowComment.double?12:24},{default:t(()=>{var n;return[l(c,{prop:"allowComment",label:(n=e(s).allowComment.name)!=null?n:a.$t("channel.allowComment"),rules:e(s).allowComment.required?{required:!0,message:()=>a.$t("v.required")}:void 0},{default:t(()=>[l(le,{modelValue:u.value.allowComment,"onUpdate:modelValue":o[11]||(o[11]=r=>u.value.allowComment=r)},null,8,["modelValue"])]),_:1},8,["label","rules"])]}),_:1},8,["span"])):$("",!0),e(s).allowContribute.show?(m(),f(h,{key:6,span:e(s).allowContribute.double?12:24},{default:t(()=>{var n;return[l(c,{prop:"allowContribute",label:(n=e(s).allowContribute.name)!=null?n:a.$t("channel.allowContribute"),rules:e(s).allowContribute.required?{required:!0,message:()=>a.$t("v.required")}:void 0},{default:t(()=>[l(le,{modelValue:u.value.allowContribute,"onUpdate:modelValue":o[12]||(o[12]=r=>u.value.allowContribute=r)},null,8,["modelValue"])]),_:1},8,["label","rules"])]}),_:1},8,["span"])):$("",!0),e(s).nav.show?(m(),f(h,{key:7,span:e(s).nav.double?12:24},{default:t(()=>[l(c,{prop:"nav",rules:e(s).nav.required?{required:!0,message:()=>a.$t("v.required")}:void 0},{label:t(()=>{var n;return[l(ae,{label:(n=e(s).nav.name)!=null?n:a.$t("channel.nav"),message:"channel.nav",help:""},null,8,["label"])]}),default:t(()=>[l(le,{modelValue:u.value.nav,"onUpdate:modelValue":o[13]||(o[13]=n=>u.value.nav=n)},null,8,["modelValue"])]),_:1},8,["rules"])]),_:1},8,["span"])):$("",!0),e(s).allowSearch.show?(m(),f(h,{key:8,span:e(s).allowSearch.double?12:24},{default:t(()=>{var n;return[l(c,{prop:"allowSearch",label:(n=e(s).allowSearch.name)!=null?n:a.$t("channel.allowSearch"),rules:e(s).allowSearch.required?{required:!0,message:()=>a.$t("v.required")}:void 0},{default:t(()=>[l(le,{modelValue:u.value.allowSearch,"onUpdate:modelValue":o[14]||(o[14]=r=>u.value.allowSearch=r)},null,8,["modelValue"])]),_:1},8,["label","rules"])]}),_:1},8,["span"])):$("",!0),(m(!0),T(M,null,A(e(Y),n=>(m(),f(h,{key:n.code,span:n.double?12:24},{default:t(()=>[l(c,{prop:`customs.${n.code}`,rules:n.required?{required:!0,message:()=>a.$t("v.required")}:void 0},{label:t(()=>[l(ae,{label:n.name},null,8,["label"])]),default:t(()=>[l($l,{field:n,modelValue:u.value.customs[n.code],"onUpdate:modelValue":r=>u.value.customs[n.code]=r,"model-key":u.value.customs[n.code+"_key"],"onUpdate:model-key":r=>u.value.customs[n.code+"_key"]=r},null,8,["field","modelValue","onUpdate:modelValue","model-key","onUpdate:model-key"])]),_:2},1032,["prop","rules"])]),_:2},1032,["span"]))),128)),u.value.type===2?(m(),f(h,{key:9,span:e(s).text.double?12:24},{default:t(()=>{var n;return[l(c,{prop:"text",label:(n=e(s).text.name)!=null?n:a.$t("channel.text"),rules:e(s).text.required?{required:!0,message:()=>a.$t("v.required")}:void 0},{default:t(()=>[l(e(Vl),{modelValue:u.value.text,"onUpdate:modelValue":o[15]||(o[15]=r=>u.value.text=r)},null,8,["modelValue"])]),_:1},8,["label","rules"])]}),_:1},8,["span"])):$("",!0)]),_:2},1024)]),_:2},1024),l(h,{span:6,class:"el-form--label-top label-top"},{default:t(()=>[l(We,{type:"border-card",class:"ml-5"},{default:t(()=>[l(Qe,{label:a.$t("channel.tabs.setting")},{default:t(()=>{var n,r,L,P;return[l(c,{prop:"parentId",label:(n=e(R).parent.name)!=null?n:a.$t("channel.parent")},{default:t(()=>[l(Ne,{modelValue:u.value.parentId,"onUpdate:modelValue":o[16]||(o[16]=y=>u.value.parentId=y),data:e(te),"node-key":"id",props:{label:"name",disabled:"disabled"},"render-after-expand":!1,"check-strictly":"",clearable:"",class:"w-full"},null,8,["modelValue","data"])]),_:1},8,["label"]),l(c,{prop:"type",label:(r=e(R).type.name)!=null?r:a.$t("channel.type"),rules:{required:!0,message:()=>a.$t("v.required")}},{default:t(()=>[l(K,{modelValue:u.value.type,"onUpdate:modelValue":o[17]||(o[17]=y=>u.value.type=y),class:"w-full"},{default:t(()=>[(m(),T(M,null,A([1,2,3,4,5],y=>l(g,{key:y,label:a.$t(`channel.type.${y}`),value:y},null,8,["label","value"])),64))]),_:1},8,["modelValue"])]),_:1},8,["label","rules"]),l(c,{prop:"processKey",label:(L=e(R).processKey.name)!=null?L:a.$t("channel.processKey"),rules:e(R).processKey.required?{required:!0,message:()=>a.$t("v.required")}:void 0},{default:t(()=>[l(K,{modelValue:u.value.processKey,"onUpdate:modelValue":o[18]||(o[18]=y=>u.value.processKey=y),clearable:"",class:"w-full"},{default:t(()=>[(m(!0),T(M,null,A(N.value,y=>(m(),f(g,{key:y.key,label:y.name,value:y.key},null,8,["label","value"]))),128))]),_:1},8,["modelValue"])]),_:1},8,["label","rules"]),l(c,{prop:"pageSize",label:(P=e(R).pageSize.name)!=null?P:a.$t("channel.pageSize"),rules:{required:!0,message:()=>a.$t("v.required")}},{default:t(()=>[l(Oe,{modelValue:u.value.pageSize,"onUpdate:modelValue":o[19]||(o[19]=y=>u.value.pageSize=y),min:1,max:200},null,8,["modelValue"])]),_:1},8,["label","rules"])]}),_:1},8,["label"])]),_:1})]),_:1})]),_:2},1024)]),_:1},8,["name","queryBean","createBean","updateBean","deleteBean","beanId","beanIds","focus","initValues","toValues","values","model-value","disableEdit"])}}});const Cl=Ge(kl,[["__scopeId","data-v-32342056"]]),ql={class:"mb-3"},Tl={class:"app-block mt-3"},Il={name:"ChannelList"},jl=ze({...Il,setup(X){const{t:ne}=He(),j=v({}),D=v(),V=v(),q=v([]),u=v([]),N=v(!1),z=v(!1),k=v(),O=J(()=>De(q.value).map(i=>i.id)),B=v(!1),E=v(),Q=v([]),I=v([]),F=i=>H.allChannelPermission||Q.value.includes(i.id),s=async()=>{N.value=!0;try{q.value=await Re({...el(j.value),Q_OrderBy:D.value}),B.value=Object.values(j.value).filter(i=>i!==void 0&&i!=="").length>0||D.value!==void 0,B.value||(q.value=Ee(q.value))}finally{N.value=!1}},R=async()=>{H.epRank>0&&(I.value=await je({category:"sys_article",latestVersion:!0}))},Y=async()=>{Q.value=await Ae()};Ye(()=>{s(),R(),Y()});const te=({column:i,prop:b,order:_})=>{var a;b?D.value=((a=i.sortBy)!=null?a:b)+(_==="descending"?"_desc":""):D.value=void 0,s()},G=()=>s(),oe=()=>{V.value.clearSort(),ll(j.value),D.value=void 0,s()},Z=i=>{k.value=void 0,E.value=i,z.value=!0},x=i=>{k.value=i,E.value=null,z.value=!0},ee=async i=>{await Fe(i),s(),al.success(ne("success"))},se=async(i,b)=>{const _=nl(i,De(q.value),b);await vl(_),await s(),i.forEach(a=>{V.value.toggleRowSelection(rl(q.value,o=>o.id===a.id))})};return(i,b)=>{const _=w("el-button"),a=w("el-popconfirm"),o=w("el-table-column"),C=w("el-tag"),c=w("el-table"),h=Ze("loading");return m(),T("div",null,[ue("div",ql,[l(e(hl),{params:j.value,onSearch:G,onReset:oe},{default:t(()=>[l(e(fl),{label:i.$t("channel.name"),name:"Q_Contains_name"},null,8,["label"])]),_:1},8,["params"])]),ue("div",null,[l(_,{type:"primary",disabled:e(W)("channel:create"),icon:e(tl),onClick:b[0]||(b[0]=p=>Z(void 0))},{default:t(()=>[U(S(i.$t("add")),1)]),_:1},8,["disabled","icon"]),l(a,{title:i.$t("confirmDelete"),onConfirm:b[1]||(b[1]=p=>ee(u.value.map(g=>g.id)))},{reference:t(()=>[l(_,{disabled:u.value.length<=0||e(W)("channel:delete"),icon:e(ol)},{default:t(()=>[U(S(i.$t("delete")),1)]),_:1},8,["disabled","icon"])]),_:1},8,["title"]),l(wl,{disabled:u.value.length<=0||B.value||e(W)("org:update"),onMove:b[2]||(b[2]=p=>se(u.value,p)),class:"ml-2"},null,8,["disabled"]),l(e(bl),{name:"channel",class:"ml-2"})]),ue("div",Tl,[xe((m(),f(c,{ref_key:"table",ref:V,"row-key":"id","default-expand-all":"",data:q.value,onSelectionChange:b[3]||(b[3]=p=>u.value=p),onRowDblclick:b[4]||(b[4]=p=>x(p.id)),onSortChange:te},{default:t(()=>[l(e(yl),{name:"channel"},{default:t(()=>[l(o,{type:"selection",selectable:F,width:"45"}),l(o,{property:"name",label:i.$t("channel.name"),sortable:"custom","show-overflow-tooltip":""},{default:t(({row:p})=>[U(S(B.value?p.names.join(" / "):p.name),1)]),_:1},8,["label"]),l(o,{property:"alias",label:i.$t("channel.alias"),sortable:"custom","show-overflow-tooltip":""},null,8,["label"]),l(o,{property:"channelModel.name",label:i.$t("channel.channelModel"),display:"none",sortable:"custom","show-overflow-tooltip":""},null,8,["label"]),l(o,{property:"articleModel.name",label:i.$t("channel.articleModel"),sortable:"custom","show-overflow-tooltip":""},null,8,["label"]),l(o,{property:"processKey",label:i.$t("channel.processKey"),sortable:"custom","show-overflow-tooltip":""},{default:t(({row:p})=>{var g;return[U(S((g=I.value.find(K=>K.key===p.processKey))==null?void 0:g.name),1)]}),_:1},8,["label"]),l(o,{property:"nav",label:i.$t("channel.nav")},{default:t(({row:p})=>[l(C,{type:p.nav?"success":"info",size:"small"},{default:t(()=>[U(S(i.$t(p.nav?"yes":"no")),1)]),_:2},1032,["type"])]),_:1},8,["label"]),l(o,{property:"id",label:"ID",width:"64",sortable:"custom"}),l(o,{label:i.$t("table.action")},{default:t(({row:p})=>[l(_,{type:"primary",disabled:e(W)("channel:create")||!F(p),onClick:g=>Z(p),size:"small",link:""},{default:t(()=>[U(S(i.$t("addChild")),1)]),_:2},1032,["disabled","onClick"]),l(_,{type:"primary",disabled:e(W)("channel:update"),onClick:g=>x(p.id),size:"small",link:""},{default:t(()=>[U(S(i.$t("edit")),1)]),_:2},1032,["disabled","onClick"]),l(a,{title:i.$t("confirmDelete"),onConfirm:g=>ee([p.id])},{reference:t(()=>[l(_,{type:"primary",disabled:e(W)("channel:delete")||!F(p),size:"small",link:""},{default:t(()=>[U(S(i.$t("delete")),1)]),_:2},1032,["disabled"])]),_:2},1032,["title","onConfirm"])]),_:1},8,["label"])]),_:1})]),_:1},8,["data"])),[[h,N.value]])]),l(Cl,{modelValue:z.value,"onUpdate:modelValue":b[5]||(b[5]=p=>z.value=p),beanId:k.value,beanIds:e(O),parent:E.value,onFinished:s},null,8,["modelValue","beanId","beanIds","parent"])])}}});export{jl as default};