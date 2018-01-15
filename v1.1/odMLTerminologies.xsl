<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fn="http://www.w3.org/2005/02/xpath-functions">
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
        <h3>How to use:</h3>
        <p>The terminologies (see below) generally define the names of properties. In some cases we also define
          "values". This is mainly the case if the occurrence of a certain property value requires more properties
          for further specification. One example for this would be the switching frequency on an amplifier used
          in an electrophysiological experiment. This property is only meaningful if the amplifier was used in
          in a discontinuous operation mode.
          <ul>
            <li>Please understand these names as suggestions!</li>
            <li>Thus, if you find a property definition fitting your needs please use it.</li>
            <li>Otherwise simply create your own properties. </li>
            <li>These may not be recognized by other tools but your metadatum is stored!</li>
            <li>If you further find that the just created property is of general interest please provide a definition
              and do not hesitate to send it to us. We would be happy to include it. </li>
          </ul>
        </p>
        <h3>So far defined terminologies</h3>
        <p>The following Terminologies contain definitions according to the section name. If you specify e.g.
          the sample rate of an analog input device include it contained within the respective section into
          your odML - file.</p>
        <xsl:variable name="baseurl" select="baseURL"/>
        <ol>
          <xsl:if test="section">
            <xsl:for-each select="section">
              <br/>
              <xsl:call-template name="sectionTemplate">
                <xsl:with-param name="url" select="$baseurl"/>
              </xsl:call-template>
            </xsl:for-each>
          </xsl:if>
        </ol>
      </body>
    </html>
  </xsl:template>

  <!-- ************************************************  -->
  <!--              section template.                    -->
  <xsl:template name="sectionTemplate" match="section">
    <xsl:param name="url"/>
    <!-- combine the link name -->
    <xsl:variable name="linkName">
      <xsl:choose>
        <xsl:when test="baseURL">
          <xsl:value-of select="concat(baseURL,type,'.xml')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="concat($url,type,'.xml')"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <!-- set new baseurl if specified within this section otherwise use the old one -->
    <xsl:variable name="baseurl">
      <xsl:choose>
        <xsl:when test="baseURL">
          <xsl:value-of select ="baseURL"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select ="$url"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <!-- the anchor of this section -->
    <xsl:variable name="anchor" select ="type"/>
    <!--   debug
    <p>debug</p>
    <p>link: <xsl:value-of select="$linkName"/></p>
    <p>baseurl: <xsl:value-of select="$baseurl"/></p>
    <p>anchor: <xsl:value-of select="$anchor"/></p>
    <p>debug</p>
    -->
    <!--create the list item -->
    <li>
      <a name="{$anchor}"></a>
      <xsl:choose>
        <xsl:when test="type">
          <a  href="{$linkName}"><xsl:value-of select="concat(name,' - [',type,']')"/></a><br/>
        </xsl:when>
        <xsl:otherwise>
          <a  href="{$linkName}"><xsl:value-of select="name"/></a><br/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test ="definition">
        <p><xsl:value-of select="definition"/></p>
      </xsl:if>
      <ul>
        <xsl:for-each select="section">
          <xsl:call-template name="sectionTemplate">
            <xsl:with-param name="url" select="$baseurl"/>
          </xsl:call-template>
        </xsl:for-each>
      </ul>
    </li>
  </xsl:template>

</xsl:stylesheet>
