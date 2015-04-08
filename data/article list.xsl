<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Source Articles</title>
            </head>
            <body>
                <h3>Source Articles</h3>
                <h4>List of Articles (Links under construction)</h4>
                <ul>
                    <xsl:apply-templates select="//article/header">
                        <xsl:sort select="not(number(titre/@num))"/> 
                        <xsl:sort select="number(titre/@num)" data-type="number"/> 
                        <xsl:sort select="substring((translate(titre,'Le', ' ')),2)"/>
                        <xsl:sort select="substring((translate(titre,'Les', ' ')),2)"/>
                        <xsl:sort select="substring((translate(titre,'La', ' ')),2)"/>
                        <xsl:sort select="substring((translate(titre,'Un', ' ')),2)"/>
                        <xsl:sort select="substring((translate(titre,'Une', ' ')),2)"/>
                        <xsl:sort select="titre"/>
                    </xsl:apply-templates>
                </ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="article/header">
        <li>
            <a href="{url}">
                <xsl:apply-templates select="titre"/>
            </a>
        </li>
    </xsl:template>
</xsl:stylesheet>

<!--Ignore «, Le, Les, La, reorder so that á follows a


<titre>(\d+\s)
    <titre num="\1">\1-->
