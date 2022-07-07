data "local_file" "graphql_schema" {
    filename = "modules/appsync/schema.graphql"
}

resource "aws_appsync_graphql_api" "appsync" {
    name = "${var.prefix}-appsync"
    authentication_type = "API_KEY"
    schema = data.local_file.graphql_schema.content
}

resource "aws_appsync_api_key" "appsync_api_key" {
    api_id = aws_appsync_graphql_api.appsync.id
}