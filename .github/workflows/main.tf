provider "github" {
  token = var.github_token
}

resource "github_repository" "my_website" {
  name        = "my-static-website"
  description = "My static website hosted on GitHub Pages"
  homepage_url = "https://ji-podhead.github.io/ji-podhead-blog"
}

resource "github_repository_contents" "upload_build_directory" {
  repository = github_repository.my_website.name
  content    = file("${path.module}/build/index.html")
  filename   = "build/index.html"
  overwrite  = true
}

# Optional: Add this if you want to upload the entire build directory recursively
resource "null_resource" "upload_build_directory_recursive" {
  provisioner "local-exec" {
    command = <<-EOT
      rsync -av --delete ${path.module}/build/ ${github_repository.my_website.clone_url}/build/
    EOT
  }
}
