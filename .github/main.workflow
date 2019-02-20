workflow "Deploy" {
  resolves = ["WordPress Plugin Deploy"]
  on = "push"
}

# Filter for tag
action "tag" {
    uses = "actions/bin/filter@master"
    args = "tag"
}

action "WordPress Plugin Deploy" {
  needs = ["tag"]
  uses = "helen/actions-wordpress/dotorg-plugin-deploy@master"
  secrets = ["SVN_PASSWORD", "SVN_USERNAME"]
  env = {
    SLUG = "post-contributor"
  }
}
