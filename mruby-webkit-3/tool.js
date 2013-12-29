var typeDisplayed = null;
var displayed = null;
var displayedIsInterface = null;

function init() {
  body = document.getElementsByTagName("body")[0]
  ca = body.className.split(" ");
  if (ca.indexOf("class") > -1) 
  {
    typeDisplayed = "class";
    displayedIsInterface = true;      
  }
  else if (ca.indexOf("iface") > -1)
  {
    typeDisplayed = "iface";
    displayedIsInterface = true;
  }
  else if (ca.indexOf("namespace") > -1)
  {
    typeDisplayed = "namespace"
    displayedIsInterface = null;
  }
  
  displayed = body["id"];
}

function fill_interfaces() {
  x=document.getElementById("interfaces");  
  
  x.onchange = function() {
    window.location = namespace.name+"_"+x.options[x.selectedIndex].value+".html";
  }
  
  if (displayedIsInterface)
  {
    option=document.createElement("option");
    option.text = displayed;
    x.add(option,null);
  }
  else {
    option=document.createElement("option");
    option.text = namespace.name;
    x.add(option,null);
  }
  
  a = [];
  
  for (name in namespace.interfaces)
  {
    a.push(name);
  }
  
  for (name in a.sort())
  {
    option=document.createElement("option");
    option.text = a[name];
    x.add(option,null);
  }
}

function makeFunc2(n) { return function() {
  e = document.getElementById(n);

  if (e.innerText == "(Expand)")
  {
    e.click();
  }
}}

function makeFunc(j,t,d) { return function() { 
  o = document.getElementById(j).style.display;
  document.getElementById(j).style.display=d;
  if (d == "none")
  {
    t.innerText = "(Expand)";  
  }
  else
  {
    t.innerText = "(Collapse)";  
  }
  
  t.onclick = makeFunc(j,t,o)
}}

init();
fill_interfaces();

q = ["inherits_summary", "ifaces_summary", "class_methods_summary", "constants_summary","enums_summary","flags_summary", "enums_details", "flags_details", "instance_methods_summary", "signals_summary", "class_methods_details", "instance_methods_details", "signals_details"];
for (i in q)
{
  ele = document.getElementById(q[i]+"_header")
  if (ele)
  {
    t=document.getElementById(q[i]+'_toggle');
    t.onclick = makeFunc(q[i],t,"none");
  }
}

q = ["class_methods", "enums","flags","instance_methods", "signals"];
for (i in q)
{
  e = document.getElementById(q[i]+"_summary")
  if (e)
  {
    l = e.getElementsByTagName("a");
    if (e && l.length > 0)
    {
      for (ii in l)
      {
        ele = l[ii];
        ele.onclick = makeFunc2(q[i]+"_details_toggle");
      }
    }
  }
}

  e=document.getElementById("inherits_summary_toggle");
  e ? e.click() : null;

if (typeDisplayed == "namespace")
{
  e=document.getElementById("enums_summary_toggle");
  e ? e.click() : null;

  e=document.getElementById("flags_summary_toggle");
  e ? e.click() : null;

  e=document.getElementById("constants_summary_toggle");
  e ? e.click() : null;

  e=document.getElementById("enums_details_toggle");
  e ? e.click() : null;

  e=document.getElementById("flags_details_toggle");
  e ? e.click() : null;

  e=document.getElementById("constants_details_toggle");
  e ? e.click() : null;
}
