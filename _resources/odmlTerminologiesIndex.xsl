<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fn="http://www.w3.org/2005/02/xpath-functions"
                xmlns:odml="http://www.g-node.org/odml">
  <!-- ************************************************  -->
  <!--                   root template                   -->
  <xsl:template match="odML">
    <html>
      <head>
        <link rel="stylesheet" href="./odml_style.css" />
        <link href="./odMLIcon.ico" rel="shortcut icon" livesrc="./odMLIcon.png" />
      </head>

       <body>
        <header>
            <h1>odML Terminologies</h1>
            <p>data model for storing arbitrary metadata</p>
        </header>

        <div class="wrapper">
            <section>
            <p><a href="index.html"><img src="./odMLTitle.png" /></a></p>
                <ol>
                  <xsl:if test="section">
                    <xsl:for-each select="section">
                      <xsl:call-template name="sectionTemplate"/>
                    </xsl:for-each>
                  </xsl:if>
                </ol>
            </section>
         </div>
      </body>
    </html>
  </xsl:template>

  <!-- ************************************************  -->
  <!--              section template.                    -->
  <xsl:template name="sectionTemplate" match="section">
    <!--create the list item -->
    <xsl:variable name="linkurl" select="include"/>
    <li>
      <a href="{$linkurl}"><xsl:value-of select="concat(type, ': ', name, ' (Type/Name)')"/></a>
      <ul>
        <xsl:for-each select="section">
          <xsl:call-template name="sectionTemplate"/>
        </xsl:for-each>
      </ul>
    </li>
  </xsl:template>

</xsl:stylesheet>
