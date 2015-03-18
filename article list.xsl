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
                    <xsl:apply-templates select="//article/header" mode="toc"/>
                </ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="article/header" mode="toc">
        <li>
            <xsl:apply-templates select="titre" mode="toc"/>
        </li>
    </xsl:template>
    <xsl:template match="article">
        <h3>
        <xsl:apply-templates select="header/titre"/>
        </h3>
        <br/>
        <xsl:apply-templates select="auteur/nom"/><xsl:text>. </xsl:text>
        <xsl:apply-templates select="auteur/association"/>    
        <br/>
        <xsl:apply-templates select="corps"/>
    </xsl:template>
</xsl:stylesheet>
