import type { CreateTableCommandInput } from '@aws-sdk/client-dynamodb';
export default function getRelevantTables(dbTables: string[], configTables: CreateTableCommandInput[]): string[];
