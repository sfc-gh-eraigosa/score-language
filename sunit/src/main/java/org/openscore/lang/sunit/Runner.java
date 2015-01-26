/*******************************************************************************
 * (c) Copyright 2014 Hewlett-Packard Development Company, L.P.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Apache License v2.0 which accompany this distribution.
 *
 * The Apache License is available at
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 *******************************************************************************/
package org.openscore.lang.sunit;

import org.openscore.lang.compiler.SlangCompiler;
import org.openscore.lang.compiler.SlangCompilerImpl;
import org.openscore.lang.compiler.SlangSource;
import org.openscore.lang.entities.CompilationArtifact;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashSet;

public class Runner {

    public static void main(String[] args) {
        AbstractApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/sunitContext.xml");
        context.registerShutdownHook();
        try {
            SlangCompiler slang = context.getBean(SlangCompilerImpl.class);
            URI flowSource = getUri("/sunit/tests/simple-test.sl");
            URI opSource = getUri("/sunit/tests/ops/basic_op.sl");

            HashSet<SlangSource> dependencies = new HashSet<>();
            dependencies.add(SlangSource.fromFile(opSource));
            CompilationArtifact compilationArtifact = slang.compileFlow(SlangSource.fromFile(flowSource), dependencies);
            if (compilationArtifact != null) {
                System.out.println("Complied successfully");
            }
        } catch (Throwable throwable) {
            System.out.println(throwable.getMessage());
        }
        System.exit(136);
    }

    private static URI getUri(String path) throws URISyntaxException {
        return Runner.class.getResource(path)
                                     .toURI();
    }

}
