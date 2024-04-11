{ # 0. Seeds ----------------------------------------------------------------
 
  { ## 0.1 - Spatial -------------------------------------------------------------------
    "code/spatial/1-gdb-import.R"
    "code/spatial/2-parquet-export.R"
    "code/spatial/3-eda.R"
    "code/crosswalks/crosswalks.R"
  }
  
  { ## 0.2 - Line level metadata -------------------------------------------------------------------
    "code/line-level-sources/v1.0/line_level_health_survey_child_v1.0.R"
    "code/line-level-sources/v1.0/line_level_health_survey_adult_v1.0.R"
  }
  
  { ## 0.3 - Pipeline seeds -------------------------------------------------------------------
    "code/schematics/schematics.R"
    "datasets/_src/_src.R"
    "code/domains/domains.R"
  }
  
}

{ # 1. Data Catalog  ----------------------------------------------------------------
    
  { ## 1.0 - Dev -------------------------------------------------
    etl_APM_DAILY_v1.0(etl, env = 'prod')
    etl_BEC_v1.0(etl, env = 'prod')
    etl_SEC_Survey_v1.0(etl, env = 'prod')
  }
  
  { ## 1.1 - Extract + Transform -------------------------------------------------
    "code/etl/1-prod.R"
    "code/etl/2-cubes.R"
  }
  
  { ## 1.3 - General Inventory  --------------------------------------------------------------------
    "code/etl/3-inventory-metadata.R"
  }

  
  { # 1.4 - Post ETL Marts ----------------------------------------------------------------
    
    { ## Frontend (Azure Static Web App)  --------------------------------------------------------------------
      "code/marts/v1.0/next-js-portal.R"
      "code/marts/v1.0/city-profiles.R" 
      
    }
    
    { ## Backend (Azure Blob Storage + Functions App) -------------------------------------------
      "code/marts/v1.0/api-devtools.R"
      "code/marts/v1.0/api-hydration-local.R"
      "code/marts/v1.0/api-hydration-azure.R"
    }
    
  }
}

{ # 2. Spatial Repository ----------------------------------------------------------------
  "code/gis-repository/v1.0/1-import.R"
}
 
{ # 3. Products Repository ----------------------------------------------------------------
  
  ## Ingest 2023 Sep
  "code/products/2023-09-27/1-publications-api-calls.R"
  "code/products/2023-09-27/1-interactives.R"
  "code/products/2023-09-27/2-cleaning.R"
  
  ## Ingest 2024 March
  "code/products/2024-03-19/SALURBAL Publications Update March 2024.qmd"
  "code/products/2024-03-19/1-publications-api-calls.R"
  "code/products/2024-03-19/1-interactives.R"
  "code/products/2024-03-19/2-cleaning.R"
}






