<?xml version="1.0"?>
<!--+
    | Usage: java -Xmx2048m net.sf.saxon.Transform -it main THIS_FILE inDir=DIR
    | 
    +-->

<xsl:stylesheet version="2.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema"
		xmlns:xhtml="http://www.w3.org/1999/xhtml"
		xmlns:local="nightbar"
		exclude-result-prefixes="xs xhtml local">

  <xsl:strip-space elements="*"/>
  <xsl:output method="xml" name="xml"
	      encoding="UTF-8"
	      omit-xml-declaration="no"
	      indent="yes"/>

  <xsl:output method="text" name="txt"
              encoding="UTF-8"/>

  <xsl:output method="html" name="html"
              encoding="UTF-8"
              version="4.0"
              indent="yes"/>

  <xsl:param name="inDir" select="'in'"/>
  <xsl:param name="outDir" select="'_out_'"/>
  <xsl:variable name="of" select="'html'"/>
  <xsl:variable name="e" select="$of"/>
  <xsl:variable name="debug" select="false()"/>
  <xsl:variable name="nl" select="'&#xa;'"/>
  <xsl:variable name="sr" select="'\*'"/>
  <xsl:variable name="rarrow" select="'▸'"/>
  <xsl:variable name="tb" select="' 	 '"/>

  
  <xsl:template match="/" name="main">

    <xsl:for-each select="for $f in collection(concat($inDir,'?recurse=no;select=*.xml;on-error=warning')) return $f">
      
      <xsl:variable name="current_file" select="(tokenize(document-uri(.), '/'))[last()]"/>
      <xsl:variable name="current_dir" select="substring-before(document-uri(.), $current_file)"/>
      <xsl:variable name="current_location" select="concat($inDir, substring-after($current_dir, $inDir))"/>
      <xsl:variable name="file_name" select="substring-before($current_file, '.xml')"/>

      <xsl:if test="true()">
	<xsl:message terminate="no">
	  <xsl:value-of select="concat('-----------------------------------------', $nl)"/>
	  <xsl:value-of select="concat('processing file ', $current_file, $nl)"/>
	  <xsl:value-of select="'-----------------------------------------'"/>
	</xsl:message>
      </xsl:if>
      <!--[]-->
      
      <xsl:result-document href="{$outDir}/{$inDir}/{$file_name}.{$of}" format="{$of}">
        <html>
          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Rus-sjd Ordbok</title>
          </head>
          <body>	    
	    <xsl:for-each select="./r/e">
	      <xsl:variable name="current_e" select="."/>

	      <xsl:variable name="e_head">
		<xsl:variable name="all_l">
		  <xsl:for-each select="./p">
		    <xsl:if test="position()&lt;3">
		      <xsl:if test="not(contains(., '_xxx_'))">
			<xsl:value-of
			    select="concat(normalize-space(.), ', ')"/>
		      </xsl:if>
		    </xsl:if>
		  </xsl:for-each>
		</xsl:variable>

		<all>
		  <xsl:for-each select="tokenize(translate($all_l,
					',',';'), ';')">
		    <xsl:if test="not(normalize-space(.)='')">
		    <l>
		      <xsl:value-of select="normalize-space(.)"/>
		    </l>
		    </xsl:if>
		  </xsl:for-each>
		</all>
	      </xsl:variable>
	      
	      <xsl:variable name="e_body">
		<xsl:for-each select="./p">
		    <xsl:if test="position()=3">
		      <xsl:if test="not(contains(., '_xxx_'))">
			<i>
			  <xsl:value-of select="concat(' ', normalize-space(.))"/>
			</i>
		      </xsl:if>
		      
		      <!-- pil til høyre: grense mellom rus og sjd -->
		      <xsl:value-of select="concat(' ',  $rarrow, ' ')"/>
		      
		    </xsl:if>
		    
		    <xsl:if test="position()=4">
		      <xsl:if test="not(contains(., '_xxx_'))">
			<xsl:value-of select="concat(' ', normalize-space(.))"/>
		      </xsl:if>
		    </xsl:if>
		    
		    <xsl:if test="position()=5">
		      <xsl:if test="not(contains(., '_xxx_'))">
			<xsl:value-of select="concat(' ', normalize-space(.))"/>
		      </xsl:if>
		    </xsl:if>
		    
		    <xsl:if test="(position() &gt; 5) and 
				  (position() &lt; 9)">
		      <xsl:if test="not(contains(., '_xxx_'))">
			<xsl:value-of select="concat(' ', normalize-space(.))"/>
		      </xsl:if>
		    </xsl:if>
		    
		    <xsl:if test="position()=9">
		      <xsl:if test="not(contains(., '_xxx_'))">
			<br/>
			<b>
			  <xsl:value-of select="concat($tb, $tb, normalize-space(.))"/>
			</b>
		      </xsl:if>
		    </xsl:if>
		    
		    <xsl:if test="position()=10">
		      <xsl:if test="not(contains(., '_xxx_'))">
			<xsl:value-of select="concat(' ',
					      normalize-space(.))"/>
		      </xsl:if>
		    </xsl:if>
		    
		    <xsl:if test="position()=11">
		      <xsl:if test="not(contains(., '_xxx_'))">
			<br/>
			<b>
			  <xsl:value-of select="concat($tb, $tb, normalize-space(.))"/>
			</b>
		      </xsl:if>
		    </xsl:if>
		    
		    <xsl:if test="position()=12">
		      <xsl:if test="not(contains(., '_xxx_'))">
			<xsl:value-of select="concat(' ',
					      normalize-space(.))"/>
		      </xsl:if>
		    </xsl:if>
		    
		    <xsl:if test="position()=13">
		      <xsl:if test="not(contains(., '_xxx_'))">
			<br/>
			<b>
			  <xsl:value-of select="concat($tb, $tb, normalize-space(.))"/>
			</b>
		      </xsl:if>
		    </xsl:if>
		    
		    <xsl:if test="position()=14">
		      <xsl:if test="not(contains(., '_xxx_'))">
			<xsl:value-of select="concat(' ',
					      normalize-space(.))"/>
		      </xsl:if>
		    </xsl:if>
		    
		    <xsl:if test="position()=15">
		      <xsl:if test="not(contains(., '_xxx_'))">
			<br/>
			<b>
			  <xsl:value-of select="concat($tb, $tb, normalize-space(.))"/>
			</b>
		      </xsl:if>
		    </xsl:if>
		    
		    <xsl:if test="position()=16">
		      <xsl:if test="not(contains(., '_xxx_'))">
		      <xsl:value-of select="concat(' ',
					    normalize-space(.))"/>
		    </xsl:if>
		    </xsl:if>
		    
		  </xsl:for-each>
	      </xsl:variable>


	      <!--xsl:variable name="e_head">
		
		  <xsl:for-each select="./p">
		    <xsl:if test="position()=1">
		      <xsl:if test="not(contains(., '_xxx_'))">
			<b>
			  <xsl:value-of select="normalize-space(.)"/>
			</b>
		      </xsl:if>
		    </xsl:if>
		    
		    <xsl:if test="position()=2">
		      <xsl:if test="not(contains(., '_xxx_'))">
			<b>
			  <xsl:value-of select="normalize-space(.)"/>
			</b>
		      </xsl:if>
		    </xsl:if>
		  </xsl:for-each>
	      </xsl:variable-->

	      <xsl:for-each select="$e_head/all/l">
		<div style="margin-left:1.1em;text-indent:-1.1em">
		  <b>
		    <xsl:value-of select="concat(normalize-space(.),
					  ' ')"/>
		  </b>
		  
		  <xsl:copy-of select="$e_body"/>
		</div>
	      </xsl:for-each>
	      
	    </xsl:for-each>
	  </body>
	</html>
      </xsl:result-document>
    </xsl:for-each>
    
</xsl:template>
  
</xsl:stylesheet>
