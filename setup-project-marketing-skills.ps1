param(
    [ValidateSet("auto", "saas", "ecom", "b2b")]
    [string]$ProjectType = "auto",

    [string]$Repo = "PlatoTheOne/marketingskills",

    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

$skillSets = @{
    saas = @(
        "product-marketing-context",
        "pricing-strategy",
        "signup-flow-cro",
        "onboarding-cro",
        "page-cro",
        "seo-audit",
        "ai-seo",
        "programmatic-seo",
        "email-sequence",
        "paid-ads",
        "analytics-tracking",
        "churn-prevention",
        "referral-program"
    )
    ecom = @(
        "product-marketing-context",
        "copywriting",
        "copy-editing",
        "page-cro",
        "popup-cro",
        "form-cro",
        "paid-ads",
        "ad-creative",
        "email-sequence",
        "social-content",
        "analytics-tracking",
        "referral-program",
        "seo-audit",
        "schema-markup"
    )
    b2b = @(
        "product-marketing-context",
        "copywriting",
        "cold-email",
        "email-sequence",
        "sales-enablement",
        "revops",
        "paid-ads",
        "social-content",
        "seo-audit",
        "competitor-alternatives",
        "analytics-tracking",
        "launch-strategy"
    )
}

function Add-Matches {
    param(
        [string]$Text,
        [string[]]$Patterns,
        [int]$Weight = 1
    )
    $count = 0
    foreach ($p in $Patterns) {
        if ($Text -match $p) {
            $count += $Weight
        }
    }
    return $count
}

function Get-AutoProjectType {
    $scores = @{
        saas = 0
        ecom = 0
        b2b  = 0
    }

    $filesToScan = @(
        "README.md",
        "readme.md",
        "package.json",
        "pyproject.toml",
        "requirements.txt",
        "composer.json"
    ) | Where-Object { Test-Path $_ }

    $combinedText = ""
    foreach ($f in $filesToScan) {
        try {
            $raw = Get-Content -Path $f -Raw -ErrorAction SilentlyContinue
            if ($null -ne $raw) {
                # Keep scan bounded for speed on large files.
                if ($raw.Length -gt 300000) {
                    $raw = $raw.Substring(0, 300000)
                }
                $combinedText += "`n" + $raw
            }
        } catch {
            # Ignore unreadable files and continue detection.
        }
    }

    $dirNames = (Get-ChildItem -Directory -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Name) -join " "
    $fileNames = (Get-ChildItem -File -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Name) -join " "
    $signalsText = ($combinedText + "`n" + $dirNames + "`n" + $fileNames).ToLowerInvariant()

    $ecomPatterns = @(
        "shopify", "woocommerce", "magento", "bigcommerce", "checkout", "cart",
        "sku", "catalog", "product variant", "order", "inventory", "fulfillment",
        "pdp", "collection page"
    )
    $saasPatterns = @(
        "saas", "free trial", "signup", "onboarding", "mrr", "arr", "subscription",
        "dashboard", "workspace", "api key", "churn", "activation", "feature flag",
        "billing portal"
    )
    $b2bPatterns = @(
        "agency", "consulting", "services", "book a call", "book a demo",
        "proposal", "retainer", "client", "case study", "lead generation",
        "rfp", "outbound", "sales team", "pipeline"
    )

    $scores["ecom"] += Add-Matches -Text $signalsText -Patterns $ecomPatterns -Weight 2
    $scores["saas"] += Add-Matches -Text $signalsText -Patterns $saasPatterns -Weight 2
    $scores["b2b"]  += Add-Matches -Text $signalsText -Patterns $b2bPatterns -Weight 2

    # Strong file/folder hints.
    if ($signalsText -match "shopify\.theme\.toml|shopify\.liquid|theme\.liquid") { $scores["ecom"] += 4 }
    if ($signalsText -match "nextauth|supabase|firebase|prisma") { $scores["saas"] += 2 }
    if ($signalsText -match "proposal|sow|statement of work") { $scores["b2b"] += 3 }

    # Choose the highest score; default to saas on ties/low-signal.
    $ordered = $scores.GetEnumerator() | Sort-Object -Property Value -Descending
    $top = $ordered | Select-Object -First 1
    $top2 = $ordered | Select-Object -First 2
    $isTie = $false
    if ($top2.Count -eq 2 -and $top2[0].Value -eq $top2[1].Value) {
        $isTie = $true
    }

    $detected = if ($isTie -or $top.Value -le 0) { "saas" } else { $top.Key }

    Write-Host ("Auto-detected project type: {0} (scores: saas={1}, ecom={2}, b2b={3})" -f `
        $detected, $scores["saas"], $scores["ecom"], $scores["b2b"])

    return $detected
}

if ($ProjectType -eq "auto") {
    $ProjectType = Get-AutoProjectType
}

$skills = $skillSets[$ProjectType]
if (-not $skills -or $skills.Count -eq 0) {
    throw "No skill set found for project type '$ProjectType'."
}

New-Item -ItemType Directory -Path ".agents" -Force | Out-Null

$contextPath = ".agents/product-marketing-context.md"
if (-not (Test-Path $contextPath)) {
    $today = Get-Date -Format "yyyy-MM-dd"
    @"
# Product Marketing Context

*Last updated: $today*

## Product Overview
**One-liner:** 
**What it does:** 
**Product category:** 
**Product type:** $ProjectType
**Business model:** 

## Target Audience
**Target companies/customers:** 
**Decision-makers/buyers:** 
**Primary use case:** 
**Jobs to be done:**
- 
- 

## Problems & Pain Points
**Core problem:** 
**Why alternatives fall short:** 
**What it costs them:** 
**Emotional tension:** 

## Competitive Landscape
**Direct competitors:** 
**Secondary competitors:** 
**Indirect alternatives:** 

## Differentiation
**Key differentiators:**
- 
- 
**Why customers choose us:** 

## Objections
| Objection | Response |
|-----------|----------|
|  |  |

## Customer Language
**How they describe the problem (verbatim):**
- ""
- ""
**Words to use:** 
**Words to avoid:** 

## Brand Voice
**Tone:** 
**Style:** 
**Personality:** 

## Proof Points
**Metrics:** 
**Customers/logos:** 
**Testimonials:** 

## Goals
**Business goal:** 
**Primary conversion action:** 
**Current metrics:** 
"@ | Set-Content -Path $contextPath -Encoding UTF8
}

$cmdDisplay = "npx skills add $Repo --skill " + ($skills -join " ")
Write-Host "Project type: $ProjectType"
Write-Host "Installing skills from: $Repo"
Write-Host "Command: $cmdDisplay"

if ($DryRun) {
    Write-Host ""
    Write-Host "Dry run only. No installation performed."
    exit 0
}

& npx skills add $Repo --skill @skills
if ($LASTEXITCODE -ne 0) {
    throw "Skill installation failed. Make sure Node.js + npx are available."
}

Write-Host ""
Write-Host "Done. Installed skills ($($skills.Count)):"
$skills | ForEach-Object { Write-Host " - $_" }
Write-Host "Context file: $contextPath"
