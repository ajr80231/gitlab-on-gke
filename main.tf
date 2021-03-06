/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module "enable_apis"  {
  source        = "terraform-google-modules/project-factory/google//modules/project_services"
  version       = "4.0.0"
  project_id    = var.project_id
  activate_apis = [
    "container.googleapis.com",
    "servicenetworking.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "redis.googleapis.com",
    "sqladmin.googleapis.com"
  ]
}

module "gke_gitlab" {
  source            = "git@github.com:bharathkkb/terraform-google-gke-gitlab.git?ref=feat-gitlab"
  certmanager_email = var.email
  project_id        = module.enable_apis.project_id
  region            = var.region
}
