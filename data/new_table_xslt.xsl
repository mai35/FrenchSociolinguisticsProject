<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head/>
            <body>
                <table>
                    <tr>
                        <th>Word</th>
                        <th>Part of Speech</th>
                        <th>Character Count</th>
                        <th>Syllable Count</th>
                    </tr>
                    <xsl:apply-templates select="//anglicisme"/>
                    
               </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//anglicisme"><tr>
        <td>
            <xsl:apply-templates select="anglicisme"/>
        </td>
        <td>
            <xsl:apply-templates select="@bf"/>
        </td>
        <td>
            <xsl:apply-templates select="@pos"/>
        </td>
        <td>
            <xsl:apply-templates select="@cc"/>
        </td>
        <td>
            <xsl:apply-templates select="@sc"/>
        </td>
    </tr></xsl:template>
</xsl:stylesheet>
