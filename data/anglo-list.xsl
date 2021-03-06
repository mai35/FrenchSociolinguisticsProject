<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head/>
            <body>
                <ul>
                    <xsl:apply-templates select="//anglicisme"/>
                </ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//anglicisme">
        <li>
            <xsl:apply-templates/>
            <xsl:text> ... </xsl:text>
            <xsl:apply-templates select="@pos"/>
        </li>
    </xsl:template>
</xsl:stylesheet>
