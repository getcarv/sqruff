SELECT 1
FROM t
WHERE a @@ b;

SELECT 1
FROM t
WHERE to_tsvector('names', a || ' ' || b) @@ 'x:*'::tsquery;

SELECT 1
FROM t
WHERE
    to_tsvector('names', a) @@ (
        SELECT string_agg(quote_literal(lexeme) || ':*', ' & ')
        FROM unnest(to_tsvector('names', b))
    )::tsquery;

SELECT 1
FROM t
WHERE a @@@ b;
