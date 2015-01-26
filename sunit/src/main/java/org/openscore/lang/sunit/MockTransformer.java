package org.openscore.lang.sunit;

import org.openscore.lang.compiler.transformers.AbstractInputsTransformer;
import org.openscore.lang.compiler.transformers.Transformer;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class MockTransformer extends AbstractInputsTransformer implements Transformer<Map, Map> {
    @Override
    public Map transform(Map rawData) {
        return rawData;
    }

    @Override
    public List<Scope> getScopes() {
        return Arrays.asList(Scope.BEFORE_TASK);
    }

    @Override
    public String keyToTransform() {
        return null;
    }
}
