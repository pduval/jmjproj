<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" xmlns:tal="http://xml.zope.org/namespaces/tal">
<head>
  <title>Compte Rendus</title>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
  <meta name="keywords" content="python web application" />
  <meta name="description" content="pyramid web application" />
  <link rel="shortcut icon" href="${request.static_url('jmproj:static/favicon.ico')}" />
  <link rel="stylesheet" href="${request.static_url('jmproj:static/pylons.css')}" type="text/css" media="screen" charset="utf-8" />
  <link rel="stylesheet" href="http://static.pylonsproject.org/fonts/nobile/stylesheet.css" media="screen" />
  <link rel="stylesheet" href="http://static.pylonsproject.org/fonts/neuton/stylesheet.css" media="screen" />
  <!--[if lte IE 6]>
  <link rel="stylesheet" href="${request.static_url('jmproj:static/ie6.css')}" type="text/css" media="screen" charset="utf-8" />
  <![endif]-->
</head>
<body>
  <div id="wrap">
    <div >
      <div class="top align-center">
        <h1>Comptes Rendus de Projet</h1>
      </div>
    </div>
    <form id="search-form" >
    <table style="width:100%;" class="align-left">
        <thead>
            <tr><th>Projet</th><th>Date</th><th>Compte Rendu</th></tr>
            <tr><th><select name="projet">
                            <option value="">-- tous --</option>
                        %for proj in projets:
                            <option value="${proj}"
                                    %if projet == proj:
                                       selected="selected"
                                    %endif
                                    >${proj}</option>
                        %endfor
                    </select>
                </th><th>&nbsp;</th><th><input type="text" name="cr_prefix" value="${cr_prefix}"/></th></tr>
        </thead>
        <tbody>
%for cr in comptes_rendus:
          <tr><td>${cr.projet}</td><td>${"{0:%d/%m/%Y}".format(cr.date_ecriture.date())}</td><td>${cr.compte_rendu}</td></tr>
%endfor
        </tbody>
    </table>

    </form>

<div>
    <h3>Nouvelle Ecriture</h3>
    <form id="new-form" action="add" method="post">
        <label> Projet: <input type="text" name="projet" value="${projet}" /></label><br />
        <label> Compte Rendu: <textarea name="compte_rendu"></textarea></label> <br />
        <input type="submit" value="Ajouter" />
               
    </form>
    <div id="footer" style="margin-top:40px">
        <div class="footer">&copy; Copyright 2008-2012, Agendaless Consulting.</div>
    </div>
    <script type="text/javascript" src="${request.static_url('jmproj:static/jquery-1.9.1.js')}"></script>
    <script type="text/javascript">
        $(document).ready(function() {
        $("#search-form").find("input,select").change(function() {
        $("#search-form").submit();
        });
        });
    </script>
</body>
</html>
