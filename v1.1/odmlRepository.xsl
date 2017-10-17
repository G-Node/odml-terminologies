<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fn="http://www.w3.org/2005/02/xpath-functions"
                xmlns:odml="http://www.g-node.org/odml">
  <!-- ************************************************  -->
  <!--                   root template                   -->
  <xsl:template match="odML">
    <html>
      <style type="text/css">
        <link href="../../images/odMLIcon.ico" rel="shortcut icon"
              csoptsettings="AQAAAD142mNgYNBomeIwObe4IIeBgYEvyTDuaAoPw3IFiwOcndS8HR1NjO0NDPTNdIzzEzOByni+A8EQNoAAPMPEQ4="
              livesrc="../../images/odMLIcon.png" />
        body { margin:0; padding:0; height:1500px; } div { border:0px
        solid #888; }
        #contentContainer {position:absolute; left:251px; top:1px; width:80%;
        height:auto;}
      </style>
      <body>
        <p><a href="index.html"><img src="../../images/odMLTitle.png" alt="" title="Home" height="128" width="707" border="0" /></a></p>
        <h1>odML - Terminologies</h1>
        <ol>
          <xsl:if test="section">
            <xsl:for-each select="section"><br/>
              <xsl:call-template name="sectionTemplate"/>
            </xsl:for-each>
          </xsl:if>
        </ol>
      </body>
    </html>
  </xsl:template>

  <!-- ************************************************  -->
  <!--              section template.                    -->
  <xsl:template name="sectionTemplate" match="section">

    <!--   debug
    <p>debug</p>
    <p>link: <xsl:value-of select="$linkName"/></p>
    <p>baseurl: <xsl:value-of select="$baseurl"/></p>
    <p>anchor: <xsl:value-of select="$anchor"/></p>
    <p>debug</p>
    -->
    <!--create the list item -->
    <xsl:variable name="linkurl" select="include"/>
    <li>
      <a  href="{$linkurl}"><xsl:value-of select="concat(type,' - type, name: ',name)"/></a><br/>
      <ul>
        <xsl:for-each select="section">
          <xsl:call-template name="sectionTemplate"/>
        </xsl:for-each>
      </ul>
    </li>
  </xsl:template>

</xsl:stylesheet>
