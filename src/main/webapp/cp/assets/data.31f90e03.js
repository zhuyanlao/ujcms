var m=Object.defineProperty,g=Object.defineProperties;var y=Object.getOwnPropertyDescriptors;var u=Object.getOwnPropertySymbols;var b=Object.prototype.hasOwnProperty,k=Object.prototype.propertyIsEnumerable;var c=(e,l,t)=>l in e?m(e,l,{enumerable:!0,configurable:!0,writable:!0,value:t}):e[l]=t,i=(e,l)=>{for(var t in l||(l={}))b.call(l,t)&&c(e,t,l[t]);if(u)for(var t of u(l))k.call(l,t)&&c(e,t,l[t]);return e},d=(e,l)=>g(e,y(l));import{y as h,z as f}from"./index.9cf006c5.js";function n(e){const l=e.filter(t=>{var r,a;return((a=(r=t.perms)==null?void 0:r.findIndex(s=>!h(s)))!=null?a:-1)===-1});for(let t=0,r=l.length;t<r;t+=1)l[t].children&&(l[t].children=n(l[t].children));return l}function S(){const{global:{t:e}}=f,l=[{label:e("menu.personal"),key:"menu.personal.key",perms:["menu.personal"],children:[{label:e("menu.personal.password"),key:"password:update",perms:["password:update","password:matches"]},{label:e("menu.personal.homepage.environment"),key:"homepage:environment",perms:["homepage:environment"]},{label:e("menu.personal.homepage.generatedKey"),key:"homepage:generatedKey",perms:["homepage:generatedKey"]},{label:e("menu.personal.machine.code"),key:"machine:code",perms:["machine:code"]},{label:e("menu.personal.machine.license"),key:"machine:license",perms:["machine:license"]}]},{label:e("menu.content"),key:"menu.content.kay",perms:["menu.content"],children:[{label:e("menu.content.article"),key:"article.key",perms:["article:page","article:list","channel:list","dict:list","model:list","block:list","processInstance:task"],children:[{label:e("list"),key:"article:page"},{label:e("add"),key:"article:create",perms:["article:create","article.submit","jodConvert:doc","jodConvert:library"]},{label:e("edit"),key:"article:update",perms:["article:update","article.submit","article:show","jodConvert:doc","jodConvert:library"]},{label:e("article.op.submit"),key:"article:submit",perms:["article:submit"]},{label:e("article.op.archive"),key:"article:archive",perms:["article:archive"]},{label:e("article.op.offline"),key:"article:offline",perms:["article:offline"]},{label:e("delete"),key:"article:delete",perms:["article:delete"]},{label:e("completelyDelete"),key:"article:completelyDelete",perms:["article:completelyDelete"]}]},{label:e("menu.content.articleReview"),key:"articleReview.key",perms:["articleReview:page","articleReview:list","channel:list","dict:list","model:list","block:list","processInstance:task"],children:[{label:e("list"),key:"articleReview:page"},{label:e("pass"),key:"articleReview:pass",perms:["articleReview:pass"]},{label:e("reject"),key:"articleReview:reject",perms:["articleReview:reject"]}]},{label:e("menu.content.channel"),key:"channel.key",perms:["channel:page","channel:list","processDefinition:list"],children:[{label:e("list"),key:"channel:page"},{label:e("add"),key:"channel:create",perms:["channel:create"]},{label:e("edit"),key:"channel:update",perms:["channel:update","channel:show"]},{label:e("delete"),key:"channel:delete",perms:["channel:delete"]}]},{label:e("menu.content.blockItem"),key:"blockItem.key",perms:["blockItem:page","blockItem:list","block:list"],children:[{label:e("list"),key:"blockItem:page"},{label:e("add"),key:"blockItem:create",perms:["blockItem:create"]},{label:e("edit"),key:"blockItem:update",perms:["blockItem:update","blockItem:show"]},{label:e("delete"),key:"blockItem:delete",perms:["blockItem:delete"]}]},{label:e("menu.content.dict"),key:"dict.key",perms:["dict:page","dict:list","dictType:list"],children:[{label:e("list"),key:"dict:page"},{label:e("add"),key:"dict:create",perms:["dict:create"]},{label:e("edit"),key:"dict:update",perms:["dict:update","dict:show"]},{label:e("delete"),key:"dict:delete",perms:["dict:delete"]}]},{label:e("menu.content.attachment"),key:"attachment.key",perms:["attachment:page","attachment:list"],children:[{label:e("list"),key:"attachment:page"},{label:e("add"),key:"attachment:create",perms:["attachment:create"]},{label:e("edit"),key:"attachment:update",perms:["attachment:update","attachment:show"]},{label:e("delete"),key:"attachment:delete",perms:["attachment:delete"]}]},{label:e("menu.content.generator"),key:"generator.key",perms:["generator:show","siteSettings:html:show","task:list","task:show","task:delete"],children:[{label:e("generator.op.fulltext.reindexAll"),key:"generator:fulltext:reindexAll",perms:["generator:fulltext:reindexAll"]},{label:e("generator.op.fulltext.reindexSite"),key:"generator:fulltext:reindexSite",perms:["generator:fulltext:reindexSite"]},{label:e("generator.html"),key:"generator:html",perms:["generator:html"]},{label:e("site.settings.html"),key:"siteSettings:html:update",perms:["siteSettings:html:update","generator:html"]}]}]},{label:e("menu.config"),key:"menu.config.key",perms:["menu.config"],children:[{label:e("menu.config.globalSettings"),key:"config.key",perms:["config:show"],children:[{label:e("config.settings.base"),key:"config:base:update",perms:["config:base:update"]},{label:e("config.settings.upload"),key:"config:upload:update",perms:["config:upload:update"]},{label:e("config.settings.security"),key:"config:security:update",perms:["config:security:update"]},{label:e("config.settings.sms"),key:"config:sms:update",perms:["config:sms:show","config:sms:update"]},{label:e("config.settings.uploadStorage"),key:"config:uploadStorage:update",perms:["config:uploadStorage:show","config:uploadStorage:update"]},{label:e("config.settings.htmlStorage"),key:"config:htmlStorage:update",perms:["config:htmlStorage:show","config:htmlStorage:update"]},{label:e("config.settings.templateStorage"),key:"config:templateStorage:update",perms:["config:templateStorage:show","config:templateStorage:update"]},{label:e("config.settings.customs"),key:"config:customs:update",perms:["config:customs:update"]}]},{label:e("menu.config.siteSettings"),key:"siteSettings.key",perms:["siteSettings:show"],children:[{label:e("site.settings.base"),key:"siteSettings:base:update",perms:["siteSettings:base:update"]},{label:e("site.settings.watermark"),key:"siteSettings:watermark:update",perms:["siteSettings:watermark:update"]},{label:e("site.settings.customs"),key:"siteSettings:customs:update",perms:["siteSettings:customs:update"]}]},{label:e("menu.config.model"),key:"model.key",perms:["model:page","model:list"],children:[{label:e("list"),key:"model:page"},{label:e("add"),key:"model:create",perms:["model:create"]},{label:e("edit"),key:"model:update",perms:["model:update","model:show"]},{label:e("delete"),key:"model:delete",perms:["model:delete"]}]},{label:e("menu.config.block"),key:"block.key",perms:["block:page","block:list","block:validation"],children:[{label:e("list"),key:"block:page"},{label:e("add"),key:"block:create",perms:["block:create"]},{label:e("edit"),key:"block:update",perms:["block:update","block:show"]},{label:e("delete"),key:"block:delete",perms:["block:delete"]}]},{label:e("menu.config.dictType"),key:"dictType.key",perms:["dictType:page","dictType:list","dictType:validation"],children:[{label:e("list"),key:"dictType:page"},{label:e("add"),key:"dictType:create",perms:["dictType:create"]},{label:e("edit"),key:"dictType:update",perms:["dictType:update","dictType:show"]},{label:e("delete"),key:"dictType:delete",perms:["dictType:delete"]}]}]},{label:e("menu.user"),key:"menu.user.key",perms:["menu.user"],children:[{label:e("menu.user.user"),key:"user.key",perms:["user:page","user:list","group:list","org:list"],children:[{label:e("list"),key:"user:page"},{label:e("add"),key:"user:create",perms:["user:create"]},{label:e("edit"),key:"user:update",perms:["user:update","user:show"]},{label:e("permissionSettings"),key:"user:updatePermission",perms:["user:updatePermission","user:show"]},{label:e("user.op.status"),key:"user:updateStatus",perms:["user:updateStatus","user:show"]},{label:e("delete"),key:"user:delete",perms:["user:delete"]}]},{label:e("menu.user.role"),key:"role.key",perms:["role:page","role:list","role:validation","channel:list"],children:[{label:e("list"),key:"role:page"},{label:e("add"),key:"role:create",perms:["role:create"]},{label:e("edit"),key:"role:update",perms:["role:update","role:show"]},{label:e("permissionSettings"),key:"role:updatePermission",perms:["role:updatePermission","role:show"]},{label:e("delete"),key:"role:delete",perms:["role:delete"]}]},{label:e("menu.user.org"),key:"org.key",perms:["org:page","org:list"],children:[{label:e("list"),key:"org:page"},{label:e("add"),key:"org:create",perms:["org:create"]},{label:e("edit"),key:"org:update",perms:["org:update","org:show"]},{label:e("delete"),key:"org:delete",perms:["org:delete"]}]},{label:e("menu.user.group"),key:"group.key",perms:["group:page","group:list"],children:[{label:e("list"),key:"group:page"},{label:e("add"),key:"group:create",perms:["group:create"]},{label:e("edit"),key:"group:update",perms:["group:update","group:show"]},{label:e("delete"),key:"group:delete",perms:["group:delete"]}]}]},{label:e("menu.log"),key:"menu.log.key",perms:["menu.log"],children:[{label:e("menu.log.loginLog"),key:"loginLog.key",perms:["loginLog:page","loginLog:list","loginLog:show"],children:[{label:e("list"),key:"loginLog:page"},{label:e("delete"),key:"loginLog:delete",perms:["loginLog:delete"]}]},{label:e("menu.log.shortMessage"),key:"shortMessage.key",perms:["shortMessage:page","shortMessage:list","shortMessage:show"],children:[{label:e("list"),key:"shortMessage:page"},{label:e("delete"),key:"shortMessage:delete",perms:["shortMessage:delete"]}]}]},{label:e("menu.system"),key:"menu.system.key",perms:["menu.system"],children:[{label:e("menu.system.site"),key:"site.key",perms:["site:page","site:list","org:list","model:list"],children:[{label:e("list"),key:"site:page"},{label:e("add"),key:"site:create",perms:["site:create"]},{label:e("edit"),key:"site:update",perms:["site:update","site:show"]},{label:e("delete"),key:"site:delete",perms:["site:delete"]}]},{label:e("menu.system.processModel"),key:"processModel.key",perms:["processModel:page","processModel:list","processDefinition:list","dict:list","processDefinition:xml"],children:[{label:e("list"),key:"processModel:page"},{label:e("add"),key:"processModel:create",perms:["processModel:create"]},{label:e("edit"),key:"processModel:update",perms:["processModel:update","processModel:show"]},{label:e("processModel.op.deploy"),key:"processModel:deploy",perms:["processModel:deploy"]},{label:e("delete"),key:"processModel:delete",perms:["processModel:delete","processDefinition:delete"]}]},{label:e("menu.system.processInstance"),key:"processInstance.key",perms:["processInstance:page","processInstance:list","processInstance:task","processHistory:activity","dict:list"],children:[{label:e("list"),key:"processInstance:page"},{label:e("delete"),key:"processInstance:delete",perms:["processInstance:delete"]}]},{label:e("menu.system.processHistory"),key:"processHistory.key",perms:["processHistory:page","processHistory:list","processInstance:task","processHistory:activity","dict:list"],children:[{label:e("list"),key:"processHistory:page"},{label:e("delete"),key:"processHistory:delete",perms:["processHistory:delete"]}]}]}];return n(l)}function M(){return{article:{mains:[{code:"title",must:!0,show:!0,double:!1,required:!0},{code:"subtitle",must:!1,show:!1,double:!1,required:!1},{code:"fullTitle",must:!1,show:!1,double:!1,required:!1},{code:"linkUrl",must:!1,show:!0,double:!1,required:!1},{code:"seoKeywords",must:!1,show:!1,double:!1,required:!1},{code:"seoDescription",must:!1,show:!0,double:!1,required:!1},{code:"author",must:!1,show:!1,double:!0,required:!1},{code:"editor",must:!1,show:!1,double:!0,required:!1},{code:"image",must:!1,show:!0,double:!1,required:!1,type:"image",imageWidth:300,imageHeight:200,imageMode:"manual"},{code:"file",must:!1,show:!1,double:!1,required:!1},{code:"video",must:!1,show:!1,double:!1,required:!1},{code:"audio",must:!1,show:!1,double:!1,required:!1},{code:"doc",must:!1,show:!1,double:!1,required:!1},{code:"imageList",must:!1,show:!1,double:!1,required:!1,type:"imageList",imageMaxWidth:1920,imageMaxHeight:1920},{code:"fileList",must:!1,show:!1,double:!1,required:!1},{code:"text",must:!1,show:!0,double:!1,required:!0,type:"editor",editorType:1,editorSwitch:!0}],asides:[{code:"channel",must:!0,show:!0,required:!0},{code:"org",must:!1,show:!0,required:!0},{code:"publishDate",must:!0,show:!0,required:!0},{code:"source",must:!1,show:!0,required:!1},{code:"articleTemplate",must:!1,show:!0,required:!1},{code:"allowComment",must:!1,show:!0,required:!0},{code:"user",must:!1,show:!1,required:!0},{code:"created",must:!1,show:!1,required:!0},{code:"modifiedUser",must:!1,show:!1,required:!1},{code:"modified",must:!1,show:!1,required:!1}]},channel:{mains:[{code:"name",must:!0,show:!0,double:!0,required:!0},{code:"alias",must:!0,show:!0,double:!0,required:!0},{code:"linkUrl",must:!0,show:!0,double:!1,required:!0},{code:"seoTitle",must:!1,show:!0,double:!0,required:!1},{code:"seoKeywords",must:!1,show:!0,double:!0,required:!1},{code:"seoDescription",must:!1,show:!0,double:!1,required:!1},{code:"channelTemplate",must:!1,show:!0,double:!0,required:!0},{code:"articleTemplate",must:!1,show:!0,double:!0,required:!0},{code:"channelModel",must:!0,show:!0,double:!0,required:!0},{code:"articleModel",must:!0,show:!0,double:!0,required:!0},{code:"nav",must:!1,show:!0,double:!0,required:!0},{code:"allowComment",must:!1,show:!0,double:!0,required:!0},{code:"allowContribute",must:!1,show:!0,double:!0,required:!0},{code:"allowSearch",must:!1,show:!0,double:!0,required:!0},{code:"text",must:!1,show:!1,double:!1,required:!1}],asides:[{code:"parent",must:!0,show:!0,required:!1},{code:"type",must:!0,show:!0,required:!0},{code:"processKey",must:!1,show:!0,required:!1},{code:"pageSize",must:!0,show:!0,required:!0}]}}}function v(e,l,t){const r=JSON.parse(l||"[]"),a=e.map(s=>d(i({},s),{label:`${t}.${s.code}`}));return r.filter(s=>a.findIndex(o=>o.code===s.code)!==-1),a.forEach(s=>{const o=r.findIndex(p=>p.code===s.code);o!==-1?r[o]=d(i(i({},s),r[o]),{must:s.must,label:s.label,type:s.type}):r.push(s)}),r}function I(e){const l={};return e.forEach(t=>{l[t.code]=t}),l}export{I as a,S as b,M as g,v as m};
