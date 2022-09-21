# =============================================================================
# Fournir les paramètres du projet
# =============================================================================

base_dir    <- "" # répertoire où se trouvent les bases harmonisées
base_alim   <- "" # la base "s07b_me_{PAYS}_2021.dta"
base_menage <- "" # la base "s00_me_{PAYS}_2021.dta"

# =============================================================================
# Valider les paramètres
# =============================================================================

# -----------------------------------------------------------------------------
# Répertoire existe
# -----------------------------------------------------------------------------

if (!fs::dir_exists(base_dir)) {
    stop("Répertoire n'existe pas")
}

# -----------------------------------------------------------------------------
# Fichiers existent
# -----------------------------------------------------------------------------

# consommation alimentaire
if (!fs::file_exists(fs::path(base_dir, base_alim))) {
    stop("La base de consommation alimentaire n'existe pas")
}

# ménage
if (!fs::file_exists(fs::path(base_dir, base_menage))) {
    stop("La base ménage n'existe pas")
}

# =============================================================================
# Créer le rapport
# =============================================================================

rapport_params <- list(
    base_dir = base_dir,
    base_alim = base_alim,
    base_menage = base_menage
)

rmarkdown::render(
    input = here::here("R/controler_conso_alim.Rmd"),
    output_dir = here::here(),
    params = rapport_params,
    encoding = "UTF-8"
)
