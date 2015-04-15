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
                        <th>Character Count</th>
                    </tr>
               
                    <xsl:for-each select="//cc">
                        <xsl:variable name="rawNumbers" select="."/>
                        <xsl:variable name="totalAnglicisms" select="302"/>
                        <xsl:variable name="totalPercent" select="($rawNumbers div $totalAnglicisms)"/>
                        <tr>
                            <td>
                                <xsl:apply-templates select="@cat"/>
                            </td>
                            <td>
                                <xsl:value-of select="format-number($totalPercent, '##.#%')" />
                            </td>
                        </tr>
                    </xsl:for-each>
                    
                    
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
