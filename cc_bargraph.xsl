<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="barWidth" select="40"/>
    <xsl:variable name="barInterval" select="$barWidth + 20"/>
    <xsl:variable name="barHeight" select="300"/>
    <xsl:variable name="barShift" select="20"/>
    <xsl:template match="/">
        <svg>
            <g transform="translate(30, 330)">
                <line x1="20" x2="20" y1="0" y2="-320" stroke="black" stroke-width="2"/>
                <line x1="20" x2="{3 * $barInterval}" y1="0" y2="0" stroke="black"
                    stroke-width="2"/>
                <text x="10" y="5" text-anchor="end">0%</text>
                <text x="10" y="{5 - $barHeight div 2}" text-anchor="end">50%</text>
                <text x="10" y="{5 - $barHeight}" text-anchor="end">100%</text>
                <xsl:apply-templates select="//cc"/>
            </g>
        </svg>
    </xsl:template>
    <xsl:template match="cc">
        <xsl:variable name="barPosition" select="position() - 1"/>
        <xsl:variable name="xPosition" select="$barPosition * $barInterval"/>
        <xsl:variable name="totalAnglicisms" select="307"/>
        <xsl:variable name="dataRaw" select="number(.)"/>
        <xsl:variable name="dataPercent" select="$dataRaw div $totalAnglicisms"/>
        <xsl:variable name="CCCat" select="@cat"/>
        
        <rect x="{$xPosition + $barShift}" y="-{$dataPercent * $barHeight}" stroke="black"
            stroke-width=".5" fill="red" width="{$barWidth}" height="{$dataPercent * $barHeight}"/>
        <text x="{$xPosition + ($barWidth div 2) + $barShift}" y="20" text-anchor="middle">
            <xsl:value-of select="$CCCat"/>
        </text>
    </xsl:template>
</xsl:stylesheet>
