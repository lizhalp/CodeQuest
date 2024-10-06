import type { DynamoDB } from '@aws-sdk/client-dynamodb';
export default function deleteTables(dynamoDB: DynamoDB, tableNames: string[]): Promise<import("@aws-sdk/client-dynamodb").DeleteTableCommandOutput[]>;
