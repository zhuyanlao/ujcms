import{d as c,u as d,D as l,r as u,T as i,_ as p,a as _,c as g,I as h,j as t,t as o,h as m,w as f,k as b}from"./index-07310ff6.js";const $=c({name:"Page403",setup(){const{t:e}=d(),s=l();return{message:u(e("error.forbidden")),handleLogout:()=>{i(),s.push("/login")}}}}),k={class:"h-full p-4 bg-gray-200"},v={class:"p-4 rounded shadow bg-white"},w=t("h1",{class:"font-bold text-3xl"},"403",-1),x={class:"mt-4"},y={class:"mt-4"};function C(e,s,n,a,B,L){const r=_("el-button");return g(),h("div",k,[t("div",v,[w,t("p",x,o(e.message),1),t("p",y,[m(r,{type:"primary",onClick:s[0]||(s[0]=N=>e.handleLogout()),plain:""},{default:f(()=>[b(o(e.$t("logout")),1)]),_:1})])])])}const D=p($,[["render",C]]);export{D as default};